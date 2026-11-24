Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525637;
	b=C1oi9FA8pQnnjFFhvLpsfyWDSjrU2azFgrZ2V7LiOONxT9DUQAlD4P0C3Ih98B2y6F5E
	 2MZ+JJBB04zLqTpqe2tvzLnGYx8t3k8gMWQQQKFwDwcFqkouP8joeIMjSBb7oIcy5T/IG
	 5WOfpa9T7/U0L1GtpOhk0Q77fIdE1QWmUUos0qdxwjLCUmetV7DKfKRRFp1AnRY2GywYb
	 yhQYlrHAYsAHgl+/cnjSx9c+i1mQScgDvC/YOXqhS9KidG8u9b5PhCXSFLot+wVLRzYev
	 uEKYNgZUVhShvmcMn8mM0WFZ911tnLmodDm2Jf20jFftKlF68PVtNApKj+/5T7z5T+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525637;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=OGZXgnfgRgczMbRxdKzz5YNMHRIhhkydTMZM2uhd6is=;
	b=eZGSpJbWPLMojs07QwvC2R07wU4ySlwRcMCe3oEEbup+eoVu3cej+I7CMG7+RFPHReii
	 YWDrACDU5ACemE/jYnsjWwwA1+o0y/ZM09vahXGAZIWXtAi0d1LKKFpyj0NpxEDQnlxxL
	 DXWUuJB1l2ttRcpEENgzWRb9KjyitOnXIjD3jJ96prhK2aTkk7AhH+WJyVIq5QvrHCSf5
	 MeHlTrC+u0E9GSYYjzvIzJqjl4YXfwPHA0O3/2KQSViWTTatK9OopYTMvtnJiogGh7Jcd
	 dIaxpddHAF6Kgc4RfXFGCcHqUPgVlDST5RpP+90FHFhGRmvU4oLVzGW2R/IwDoQq1Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=A18EvcUC;
	arc=none smtp.remote-ip=91.218.175.65
Received: from mta0.migadu.com (out-65.mta0.migadu.com [91.218.175.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27164606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 13:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27164606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=A18EvcUC
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=n3QCrIbcPMvCGHu60XljvMPoh4Nl+HXMssIukfe4cX0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795525635; v=1; x=1796130435;
 b=A18EvcUCcAsc5b5sW8FrRWkWIUwnhlal65rFjgyFiT9VRRcoJvhqrd/f6KOo0kun2erkrP7c
 jGU6GEBzq7E4aZHHHSrhw2+g4caOUnyLiEdYEvp9nxpLejjQIuBR5Mig6IpPStIXa6Z3VC/Ny0L
 fjF2t+ro9ShF6ottCDZvxIPs=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 8ce8cdb92deed85a;
	Tue, 24 Nov 2026 13:07:15 +0000
X-Mizu-Trace-ID: 8ce8cdb92deed85a
X-Migadu-Flow: FLOW_OUT
Message-ID: <e0df6f55-aae9-4abd-8434-f6b75e42a972@linux.dev>
Date: Tue, 24 Nov 2026 21:06:56 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: cui.tao@linux.dev, bpf@vger.kernel.org, tj@kernel.org,
 hannes@cmpxchg.org, mkoutny@suse.com
Subject: Re: [RFC PATCH v14 3/4] selftests/bpf: add iocost cost model test
To: sashiko-reviews@lists.linux.dev
References: <20261118131029.797007-1-cui.tao@linux.dev>
 <20261118131029.797007-4-cui.tao@linux.dev>
 <sashiko-outbox-221050@kernel.org>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <sashiko-outbox-221050@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

在 2026/11/18 21:41, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] selftests/bpf: iocost_test_env() hardcodes /sys/fs/cgroup
>   without mounting
Right, the tests access /sys/fs/cgroup without mounting anything there,
so they depend on the host's mount state and would see the tmpfs that
setup_classid_environment() leaves behind.  The next posting mounts
cgroup2 at /sys/fs/cgroup inside the private mount namespace that
iocost_test_env() creates, tolerating EBUSY, and skips the tests when
the mount fails.
> - [Low] selftests/bpf: open_nullb_dev() callers check -errno instead of
>   fd
That's a real gap.  open_nullb_dev() can return -1 with errno unset,
and the callers then pass 0 to ASSERT_OK() and keep using fd -1.  The
next posting returns a proper negative error code from the helper and
checks the fd itself with ASSERT_GE(devfd, 0).

And another one:
bpf-ci points this, the setns() unwind on the skip path may reset test_progs' cwd to "/"

Right, mntns_install() sets the pwd to the root of the new namespace on
the way back, so a skip moves the process to "/".  The next posting
saves the cwd before unshare() and fchdir()s back to it after setns().

Thanks,
Tao

> --
> 
> commit 7c8a11566574f6e4224eb8a8a97b22da0b3eb991
> Author: Tao Cui <cuitao@kylinos.cn>
> 
> selftests/bpf: add iocost cost model test
> 
> This commit adds two BPF struct_ops iocost cost models and selftests that
> attach them to a configfs-created null_blk device and verify model
> selection, IO pricing, tracepoint firing, and device removal.
> 
>> diff --git a/tools/testing/selftests/bpf/prog_tests/iocost_model.c b/tools/testing/selftests/bpf/prog_tests/iocost_model.c
>> new file mode 100644
>> index 0000000000000..0fbaeb7c5b7ef
>> --- /dev/null
>> +++ b/tools/testing/selftests/bpf/prog_tests/iocost_model.c
> [ ... ]
>> +/* open the nullb device node, creating it manually when udev hasn't */
>> +static int open_nullb_dev(const char *name, int flags)
>> +{
>> +	char path[32], syspath[64], devtok[32];
>> +	unsigned int maj, min;
>> +	dev_t dev;
>> +	struct stat st;
>> +	int fd;
>> +
>> +	snprintf(syspath, sizeof(syspath), "/sys/block/%s/dev", name);
>> +	if (read_file_token(syspath, devtok, sizeof(devtok)) ||
>> +	    sscanf(devtok, "%u:%u", &maj, &min) != 2)
>> +		return -1;
>> +	dev = makedev(maj, min);
>> +
>> +	snprintf(path, sizeof(path), "/dev/%s", name);
>> +	fd = open(path, flags);
>> +	if (fd >= 0 && fstat(fd, &st) == 0 && S_ISBLK(st.st_mode) &&
>> +	    st.st_rdev == dev)
>> +		return fd;
>> +	if (fd >= 0) {
>> +		/* a stale node from a previous run, drop and recreate */
>> +		close(fd);
>> +		fd = -1;
>> +	}
>> +	if (unlink(path) && errno != ENOENT)
>> +		return -1;
>> +	if (mknod(path, S_IFBLK | 0600, dev))
>> +		return -1;
>> +	fd = open(path, flags);
>> +	if (fd < 0)
>> +		unlink(path);
>> +	return fd;
>> +}
> 
> [Severity: Low]
> Can ASSERT_OK(devfd < 0 ? -errno : 0, ...) in serial_test_iocost_model()
> and serial_test_iocost_model_streams() pass when open_nullb_dev() fails?
> 
> If read_file_token() hits EOF without setting errno, sscanf() fails to
> match two tokens, or unlink(path) succeeds and leaves errno at 0 after
> the second open() fails, open_nullb_dev() returns -1 with errno == 0.
> The callers then pass 0 to ASSERT_OK() and proceed to call
> posix_fadvise(), read(), pread(), and close() on fd -1.  Using
> ASSERT_OK_FD(devfd, ...) in the callers (or returning a negative error
> code from open_nullb_dev()) would catch any failure directly.
> 
> [ ... ]
>> +static bool iocost_test_env(void)
>> +{
>> +	static bool ready;
>> +	struct statfs sf;
>> +	int orig_ns = -1, supported;
>> +	bool ok = false;
>> +
>> +	if (geteuid() != 0) {
>> +		printf("%s:SKIP:needs root\n", __func__);
>> +		test__skip();
>> +		return false;
>> +	}
>> +
>> +	if (statfs("/sys/fs/cgroup", &sf) ||
>> +	    sf.f_type != CGROUP2_SUPER_MAGIC) {
>> +		printf("%s:SKIP:needs cgroup v2 at /sys/fs/cgroup\n",
>> +		       __func__);
>> +		test__skip();
>> +		return false;
>> +	}
> [ ... ]
>> +	/*
>> +	 * Isolate the configfs and cgroup mounts from the host. A
>> +	 * failed setup unwinds the namespace so that a later retry does
>> +	 * not stack private namespaces.
>> +	 */
>> +	orig_ns = open("/proc/self/ns/mnt", O_RDONLY);
>> +	if (unshare(CLONE_NEWNS) ||
>> +	    mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL)) {
>> +		printf("%s:SKIP:cannot make mounts private: %s\n",
>> +		       __func__, strerror(errno));
>> +		test__skip();
>> +		goto out;
>> +	}
>> +	mkdir("/sys/kernel/config", 0755);
>> +	(void)mount("none", "/sys/kernel/config", "configfs", 0, NULL);
> 
> [Severity: Medium]
> Will all three iocost tests skip when /sys/fs/cgroup is not already a
> cgroup2 mount or after an earlier cgroup v1 test runs in the same
> test_progs process?
> 
> iocost_test_env(), cgroupfs_has_controller(), readback_model(),
> write_cost_model(), and the io.cost.qos writes all access /sys/fs/cgroup
> directly without mounting cgroup2 there, while cgroup_setup_and_join() in
> tools/testing/selftests/bpf/cgroup_helpers.c mounts cgroup2 at /mnt
> (CGROUP_MOUNT_PATH).  In addition, setup_classid_environment() in
> cgroup_helpers.c mounts tmpfs at /sys/fs/cgroup (CGROUP_MOUNT_DFLT) and
> cleanup_classid_environment() leaves that tmpfs mounted:
> 
> tools/testing/selftests/bpf/cgroup_helpers.c:setup_classid_environment() {
> 	...
> 	if (mount("tmpfs", CGROUP_MOUNT_DFLT, "tmpfs", 0, NULL) &&
> 	    errno != EBUSY) {
> 		log_err("mount cgroup base");
> 		return 1;
> 	}
> 	...
> }
> 
> When a test using setup_classid_environment() runs before
> serial_test_iocost_model*, statfs("/sys/fs/cgroup", &sf) sees TMPFS_MAGIC
> instead of CGROUP2_SUPER_MAGIC and skips the tests.  Using the cgroup2
> mount managed by cgroup_helpers.c (via get_root_cgroup() or
> write_cgroup_file("", ...) / read_cgroup_file("", ...)), or mounting
> cgroup2 inside the private mount namespace created by iocost_test_env(),
> would avoid relying on the host's /sys/fs/cgroup mount state.
> 

