Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3589D47F2F6
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 12:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351866; cv=none; b=sUwsoAbQRfeeLnImRooufS7S51ENNDXgw4XZDnkAqod05pzTp5MtZQA+3rDrVtRyAWMfp8v6PYJ+PtVovjy2SQ1clmz9uKidAHSJ5f1b3l1pr3bjlIg3FllpXIcH4aU3E4dJO9mV3YFNXI/bYifEZHE6FgltLOhu/CHt5nTTCA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351866; c=relaxed/simple;
	bh=oTS+YDDaFxN0Q1LeraRZY2cqh7z1qPcDOqRuWiPId8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhmGo67nYOEODKqS3J6ixTYZ+E0L9/SWdDW8gOLwuwZjBmiPhLVh39hiZnOH0HhN1UhShRHZAEB51IYrwTzCECQm0gNl2ExdpxWqBu4lvnDMj0b3RSjlNpIp8tG8MPp9gIuNowKZvnkqk1OP7HehyCERpO4JKT7dzqYruDabTyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dC+p+U9u; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dC+p+U9u"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66bd7857841so1455822d50.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 02 Sep 2026 05:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788351864; x=1788956664; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RArsbmdfySTb2QuEZZ7/chE2iY/l9of1tF9d4mgeG4M=;
        b=dC+p+U9ujizTBEMMPDU4QkllEWDTZIwa8K7zB4EiYYbKleRZL43pmxadzfo20J5uuB
         /M22Kjf1V5dLHhoBtxWPtSYVRtktmotfl5NoyJleI7cQSchLCejYd3amlY4hgL4fMddg
         XhUGRx08ZFRq4AnNLYorhbYTTyu/Yr6qfXZgOCJFyhFaodg9Oa7/RytPbozqD70ytg3E
         CbKjbnrgy825GTPQkfxHF052bM1aTOmnoHTtXqaKkEqK3K5Exn1/72+c8R/UlNMTtswf
         d0fr9QXNVH3EQYX8R+/PPaboqha8r97N2uicvH4bjbJu4yhGHCpwzwMzsvfBoPegFbjZ
         G+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351864; x=1788956664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RArsbmdfySTb2QuEZZ7/chE2iY/l9of1tF9d4mgeG4M=;
        b=E1rxQIMgFRpMcKoZg1ON4/RHs4HtWfOxvMiU4dKH/OTrq9FZ88u/jJkMTFpwsGam/j
         8AMgzHV+QMt+gctOb/bptLYa3rCiErN4RVbld1sp2z/upGNqM/Y3ZhJT3oQGzg7JHSyY
         HVPiFkaxqWtYgU5pnU+k1qgyDUHEjbGvy9+Cfi1cewwnybilljyb2ahxPD1dpBCwJcFX
         JfjcRSABxbR/bLRSUKYe2dZVceo9tBcR1r4MJjx4OvLWHid8weuT9maouv6DGLL8m8H1
         YjuxaF7cBOjLe3wFYi0XwoTX7s+KHM+5wj7qTuoeiTho+eEVpjSeXqJDkCUGRUZW2r3M
         c67w==
X-Gm-Message-State: AFuF++n0BuBkkE+Q0gM/AsNPwY6GU2PpBy+piVZaMIeCEgESQgjvk7uH
	Ab7PmRIGhTWsWQDEzs8T03EONh/3tQDg6U+nlCU5zyfd2Fx7ho7KmVlzyF6NA3wq
X-Gm-Gg: AYBFou1lUIyCX2XBN0XmPTCQ+JD8cXId7QS17o0YbnJDPz1VMliS7WLbJV5AyVremZB
	/ppvxQif5LIzBxvESpgxIra5D/tMgCU0U+Lfff6werdE1MigkBjUZRfn3DJ7HC2+VWkRoZcZTey
	L3wwbeLK6CFwXZSML75d7Q3FlduN+buQjx7F06YGpoV/fwebbPFbhEQ6KFLGxnQwy/umj83RgYX
	+Zk3AfFiB/sCw04hNp4wM+J1Af4fPfEIZ4iRFrgG7V8ARWMmNDPDK/N0u0p4DDXfZQSYFgXUkFF
	k7hE8bcy4HkVUIWixXV947PhJmlc7qEGhDwPPFQkuouxdecSDseUwYkQN7mztazfJJKY/0XwpoY
	zBxfNdmxAGY2UsZWnLoYpdugf3w9TH+P5WMbClUb1uHH2NOu6pfRwSzyBZ89xgwSg6bB8u6K6pH
	QSzJBcrsmswjyucfZs9uHTffOhiWucgO0VLjeG4xyq2tZI5i6rAHBMKDQNKJkYoRBsKaVoSrcUG
	mwbuB48ss+pQt5ODD1v0A==
X-Received: by 2002:a05:690e:b83:b0:668:180c:bf6a with SMTP id 956f58d0204a3-66f9bc3fc3dmr1314531d50.37.1788351863969;
        Wed, 02 Sep 2026 05:24:23 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:f78:4c8c:a6cc:a58e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66f98697fbasm1721817d50.18.2026.09.02.05.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:24:23 -0700 (PDT)
Date: Wed, 2 Sep 2026 08:24:23 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 14/15] selftests/bpf: Test the LSM policy object
 kfuncs with Landlock
Message-ID: <apgTQKnhwMyFdQcr@zenbox>
References: <20260831145858.3869191-1-utilityemal77@gmail.com>
 <20260831145858.3869191-15-utilityemal77@gmail.com>
 <20260831195327.1282C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260831195327.1282C1F000E9@smtp.kernel.org>

On Mon, Aug 31, 2026 at 07:53:26PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] File descriptors leak on the error path in test_restrict_binprm_discard().
> --
> 
> commit 7fa3010dd885254cc82b6aa2f6f254ee83a13717
> Author: Justin Suess <utilityemal77@gmail.com>
> 
> selftests/bpf: Test the LSM policy object kfuncs with Landlock
> 
> This commit adds tests for LSM policy object kfuncs interacting with Landlock.
> It tests execution confinement, audit log flags, and concurrent application
> using a syscall program and BPF RCU lock management.
> 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/lsm_policy_landlock.c b/tools/testing/selftests/bpf/prog_tests/lsm_policy_landlock.c
> > new file mode 100644
> > index 0000000000000..9270b39f5e3a7
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/prog_tests/lsm_policy_landlock.c
> [ ... ]
> > +static void test_restrict_binprm_discard(void)
> > +{
> > +	struct policy_test_env env;
> > +	char garbage_path[] = "/tmp/lsm_policy_garbage_XXXXXX";
> > +	int garbage_fd, pipe_fds[2];
> > +	char buf = 0;
> > +	pid_t pid;
> > +
> > +	if (setup_env(&env))
> > +		goto out;
> [ ... ]
> > +	if (!ASSERT_OK(pipe(pipe_fds), "pipe"))
> > +		goto out_unlink;
> > +
> > +	/*
> > +	 * Cannot use spawn_exec_child(): the same process must test its
> > +	 * write access after the failed exec.
> > +	 */
> > +	pid = fork();
> > +	if (!ASSERT_GE(pid, 0, "fork"))
> > +		goto out_unlink;
> 
> [Severity: Low]
> Does this code leak the file descriptors created by pipe() if fork() fails? 
> 
> If fork() fails here, the code jumps directly to the out_unlink label, and it 
> appears neither pipe_fds[0] nor pipe_fds[1] are closed before exiting the
> function. 
> 
> The spawn_exec_child() helper function introduced in this same commit properly 
> closes both descriptors on fork failure. Should similar cleanup be added here?
>
Will fix.

I think that's sashiko's only nit for this patchset.

https://sashiko.dev/#/patchset/20260831145858.3869191-1-utilityemal77@gmail.com

The BPF CI AI review bot didn't run on this since the patchset can't
based on a bpf tree until it catches up to the recent Landlock changes.

Justin
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260831145858.3869191-1-utilityemal77@gmail.com?part=14
