#
# unittest evn builder for redmine plugin.
#
# try execute:
#   $ make redmineinstall redminesetup plugininstall pluginsetup plugintest
#
REDMINE_MYPLUGIN=polls
EXEC_ENV=test

REDMINE_NAME=redmine
REDMINE_VERSION=4.2.5
REDMINE_EXT=tar.gz

REDMINE_DIR=${REDMINE_NAME}-${REDMINE_VERSION}
REDMINE_TARBALL=${REDMINE_NAME}-${REDMINE_VERSION}.${REDMINE_EXT}

REDMINE_DL_URL=https://www.redmine.org/releases/${REDMINE_TARBALL}

WORK_DIR=$(HOME)/work

.PHONY: all clean redmineinstall redminesetup plugininstall pluginsetup plugintest

all:

clean:
	rm -fr ${WORK_DIR}

redmineinstall:
	mkdir -vp ${WORK_DIR}
	rm -vf ${WORK_DIR}/${REDMINE_TARBALL}
	wget --no-check-certificate "${REDMINE_DL_URL}" -P ${WORK_DIR}
	tar xf ${WORK_DIR}/${REDMINE_TARBALL} -C ${WORK_DIR}

redminesetup:
	cp -vf config/database.yml ${WORK_DIR}/${REDMINE_DIR}/config/
	cd ${WORK_DIR}/${REDMINE_DIR} && bundle install
	cd ${WORK_DIR}/${REDMINE_DIR} && bundle exec rake generate_secret_token
	cd ${WORK_DIR}/${REDMINE_DIR} && RAILS_ENV=${EXEC_ENV} bundle exec rake db:migrate

plugininstall:
	cp -vr plugins/polls ${WORK_DIR}/${REDMINE_DIR}/plugins/

pluginsetup:
#	cd ${WORK_DIR}/${REDMINE_DIR}/plugins/${REDMINE_MYPLUGIN} && bundle install

plugintest:
	cd ${WORK_DIR}/${REDMINE_DIR} && RAILS_ENV=${EXEC_ENV} COVERAGE=1 bundle exec rake redmine:plugins:test NAME=${REDMINE_MYPLUGIN}
