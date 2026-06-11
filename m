Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C547E3BED75
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 09:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170648; cv=none; b=TEicqIdul7AAfXKxgxchMjjNrUXsY2vM2pjYPfJHt1qHuXKPpU+B0xsynFvQysdKDYBSIOhWpV7WpJL9Lab7dk6XvdCJPqArPkP5aZHTs3ViOnuZfx0ZSQ+alxQ9qW7p9z8kLRZJ4nxadSu9mADwcKOodcZ2wFVsuD8slH0AHGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170648; c=relaxed/simple;
	bh=AvLJ837o6aFpuSBrNftC0C9tXvgnUSWePVBKcwDdPDM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMEPr8/hR1WApr0/1OCTDPzrjxYR/d0h2QZP7itah86KqD+okCD5OVF6ZxEI/ZRTWPBgoCfR8CGekwK/1FF0ACXqqh0ChzRhND7y/vifekeR+fqPWp0PGkZmD4QbCkoU6G2DpjSHFbQrxbx47Qaa+9dOfoG2HqNC7yehDvbPamc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7ehjQB+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7ehjQB+"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490ac357c55so80660865e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 02:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781170645; x=1781775445; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oi59QYzjJTpaQKbI3rmZuInCWoY2kOoYQVRZZMK0fYI=;
        b=e7ehjQB+Fg69KM46Ax0O2Frmhgi3HOHpZH2fdakm8L+9meGlXxhGy5UWbyk+/nz1zA
         vSZa8YEsY0OlXR9ZfAykowNKf3EkZMfYFlhSgB1dFiTL0zYBWSQCKdZvugbWkkjR+FaX
         0yd9TAdGi1mANGS4fC7aUxtHj49YuJOuVCeIYa92ra+ROEAdXX+RSxx4KNUH/UTf72bi
         AJyH55nkSdMF9t7JSXWUs/KpxLBzJCHupmLdV1CjS4gcskT6zwKgpzchib+QgLYTOpjF
         BpytxUMrErLalQIMaJQB9Joy3RolJXzwZzJo1Qucn8BYHuSXavVkMlW0SR32FtFLThGU
         sW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170645; x=1781775445;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oi59QYzjJTpaQKbI3rmZuInCWoY2kOoYQVRZZMK0fYI=;
        b=fPAeLnNLpeGIX0zJmvsdkHyh15rDdKx0LxTTFymVOHxSqxK63szF/+I7nFLVOTmSuX
         qByi8DlQ6wt3UOpjrypSUFJModN5ps2mGbqWvHy+XdGsl6MjC02+k5gUkVHJ/37sVMYD
         UozYZqWm8qxHbIe/A1s9JGBvJ6Y/SLTzppewOxVYiS8Xo93aF5HIo53ihnnrBsf7pzf+
         +h7tRxPCys5JgGzkOCM1Rwj/1kKT3K6rfm/MWvlXL0VlkkuSF0eedIlFYCB80OvbSxPJ
         dplHcX3ilsNCGzrtI1tzJS2hlMYxu2ztLkfnpYNkO2ajFooVBixNpBCifKr6aEeBFiWs
         +qhA==
X-Gm-Message-State: AOJu0YwAZPvr7TWg3oAdExEmRKXLPti1PklVeDmQup5RChjIEwF8hl/5
	Dpab4IFvYauMp1eWfLKo6oIfnP5V1uid2HHnPQTAS87Qd0EQNEg4pAKt6TNLrA==
X-Gm-Gg: Acq92OH4O7XmQetWVSGU1cLJySkTL2ROutJm+hXI9wdLZuGchnF9slXfNDrdFB71gkC
	LjwmSzGAOUZk4SbjrQ6aNQFFHro7ljCk9lv8IIHahU9Dh9DkBC5akpl+/GW8q5qhhJgb64MBydZ
	2jFd+pulWlenakIivmEC0ZDYLVhize9fQcicTxeFNHhtsAUTIi+njCKYpT6IzYXH368M9NH+XcJ
	i9JIVqSdwXmO7YPt22PSNCRaqRhI9uRFYq5tY9hvwqh+kKv6+4pxrp7YcLMHXNKbf44t3sFDX2a
	ijlUn8CahxLSJe1PfotiRXsGTwfm/OpkWnGResuJLZGgSG4mDF0NXNi8ntU9ki8o6bxA7LB6Sik
	cYwe9VkA+5ToPMi/ii1VTFKoVGCJvqPU/4MnRtL0I8bMdq6dQjUrysGxfjcBGYCOMRwR434NZmi
	NFvIB9JNTIbhBUKC+D35EUPlXg3F8LM4bOViLg
X-Received: by 2002:a05:600c:c0c6:b0:490:958f:2a5e with SMTP id 5b1f17b1804b1-490e55fbd74mr23400285e9.13.1781170644815;
        Thu, 11 Jun 2026 02:37:24 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e532c778sm35669155e9.14.2026.06.11.02.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:37:24 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 11 Jun 2026 11:37:22 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv2 bpf-next 5/6] selftests/bpf: Add uprobe_multi path_fd
 fail tests
Message-ID: <aiqB0mSXsFTryaYz@krava>
References: <20260610143627.804790-6-jolsa@kernel.org>
 <20260610144822.32E831F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610144822.32E831F00893@smtp.kernel.org>

On Wed, Jun 10, 2026 at 02:48:21PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The patch references an undefined struct member `path_fd` and an undeclared macro `BPF_F_UPROBE_MULTI_PATH_FD`, which will cause compilation to fail.
> --
> 
> commit 0e3f7d4f9ed46a64d02a1c29acb4f8e2215cb7c0
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> selftests/bpf: Add uprobe_multi path_fd fail tests
> 
> This commit adds tests to the attach_api_fails suite to verify that
> invalid setups using the new path_fd feature in uprobe_multi fail as
> expected.
> 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/uprobe_multi_test.c b/tools/testing/selftests/bpf/prog_tests/uprobe_multi_test.c
> > --- a/tools/testing/selftests/bpf/prog_tests/uprobe_multi_test.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/uprobe_multi_test.c
> > @@ -536,7 +536,37 @@ static void test_attach_api_fails(void)
> 
> [ ... ]
> 
> > -	ASSERT_EQ(link_fd, -EINVAL, "pid_is_wrong");
> > +	if (!ASSERT_EQ(link_fd, -EINVAL, "pid_is_wrong"))
> > +		goto cleanup;
> > +
> > +	/* wrong path_fd */
> > +	LIBBPF_OPTS_RESET(opts,
> > +		.uprobe_multi.path = NULL,
> > +		.uprobe_multi.path_fd = -1,
> > +		.uprobe_multi.flags = BPF_F_UPROBE_MULTI_PATH_FD,
> 
> [Severity: Low]
> Does this commit depend on a missing prerequisite patch? 
> 
> The path_fd member and BPF_F_UPROBE_MULTI_PATH_FD macro do not appear to be
> defined in the current tree's bpf_link_create_opts struct or UAPI headers,
> which will cause a compilation failure here.

it compiles fine, it was added in this commit:
  bpf: Add support to specify uprobe_multi target via file descriptor

jirka

> 
> > +		.uprobe_multi.offsets = (unsigned long *)&offset,
> > +		.uprobe_multi.cnt = 1,
> > +	);
> > +
> > +	link_fd = bpf_link_create(prog_fd, 0, BPF_TRACE_UPROBE_MULTI, &opts);
> > +	if (!ASSERT_ERR(link_fd, "link_fd"))
> > +		goto cleanup;
> > +	if (!ASSERT_EQ(link_fd, -EBADF, "path_fd_is_wrong"))
> > +		goto cleanup;
> > +
> > +	/* path and path_fd both set with BPF_F_UPROBE_MULTI_PATH_FD flag */
> > +	LIBBPF_OPTS_RESET(opts,
> > +		.uprobe_multi.path = path,
> > +		.uprobe_multi.path_fd = 1,
> > +		.uprobe_multi.flags = BPF_F_UPROBE_MULTI_PATH_FD,
> > +		.uprobe_multi.offsets = (unsigned long *)&offset,
> > +		.uprobe_multi.cnt = 1,
> > +	);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260610143627.804790-6-jolsa@kernel.org?part=1
