Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2C72E4257
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 06:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761197; cv=none; b=G9KJFfzJrzCYOFKecxIv8U4jofsn2WVB+4HoW3q+c5j59qOLgYMOoo7JN7vVXNBj3GOFgoAGi3lYjLmK20s3RwT6jzQTO8umDQpBHmhfO4oItEUwE50/H5AUQ33GzkXO5YtTQo69wuWgW4aiEuWcAb/sbFb5iH51JfcEZJe26p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761197; c=relaxed/simple;
	bh=GLaZB2K+gwKIH9wEH+yvU3NKxxa8zul0fZq1t1FUP1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bbRJsYRGpLQak52YXwBHKf2dpC8+mput6LJjDLjgS+zOv9Q1lWl633qZP8D9akI+avsG9ql5m2tt3AbXtxI8i2RcE2Kz6IldwitwNBtNOAPnkzntsGXEye7zstCqqM159Ag1OLDV2SQM/Y+4mV84FdEOk/NKjIN81/GnAfug0r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGtI0CTJ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGtI0CTJ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d53197d8b5so27348185ad.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 06 Sep 2026 23:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788761195; x=1789365995; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nshbquzAgQsD94khPjnUSoSNOBjwfXeTGVGmlFk/VVs=;
        b=JGtI0CTJNjZ/FDIEqyK7AhFA5TH6bemrwhlPe4S1QTC8/pmtmewe6uJ/EFkssnKSsf
         DGcP6XhbVyUGyz1gB4zCeJQvD3mHy3VdbWrKTNaNEgHqjNBOPG/hTNTw4RqX9pfpRQbi
         ddKnqINFVPHEuyjgtdDLGpjTOkqH5ngcdRea4mduXyTQxFG/QZbyPJmA8gWK8a5dmLgk
         zR53/N8NSVBhG8sQ66J5ONE+sjm2iV1rHjoJkd5OeqTBkJdkB+jIE63MUvBpVFgEWQZs
         O/fnmVqAnwH97KC5RJzrc0nlh+uOO/T208FRbDFpjWP1EmkNKpbYxcFthfJuSL1G9R+F
         xJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761195; x=1789365995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nshbquzAgQsD94khPjnUSoSNOBjwfXeTGVGmlFk/VVs=;
        b=AxOQSbkxe29y9WD7ZOh5peQGrQfC8CJXyp7rjKr5shFh8u7hOuFDQBMhJ4EqEYn9R/
         Xv4NaYUBq413vLWn28wMjg8MZJvcNealj2dqkfBs98GblPpgYG0GEaaeN862IEaK3US/
         pB9QEbXyRL7OUP3ZqWDKzPSfMMl/dB6fscuhLMTnXw+D1Etm2RXMd3UoImnWo3zE1gnA
         mojvRGFUttYxRpzoPU3czg2emJExXwgy8Su8kmMe1b4mwCDnSwp/5ufPUfwO/I/1d+62
         ueISSBCgUpJPADDwxb23CsifUPcQoOoRlxHX56AbDJhyMhisLSJmntg+U8IvaaCTGdNx
         xT3A==
X-Gm-Message-State: AFuF++mJpZXBAo02rXgZRx0vxOZHjx5ZZaMpb62oRWjwcdE0y86iAQoE
	CiEJzML/PSyvADcdhRee5lNvBw3Jr++xphMAmxdDpe64hMIa58EAg30XwsynJZsIUg==
X-Gm-Gg: AYBFou2gfIFS4L3AngdtHtX3qtuI6fSwTrPlatJCzcbkEaPuCwEc8DaeBYmArzIjfa3
	mwjcXz6EtdMCicIarj9fLj9hrp0WAcJzJfKGSraHxq/bTO85GYQ4f9LrAgeVNk0Fv1n6FFdBv9C
	yMHeCdAb/yl5zWDBG+jOPd/TubrCvh6nRuAx4/n/tO8yPMDVnZm0p8BUlP1Jk7q/iKFs8v1JARa
	GqF2t8XNZJDaLsFEGAQFTCf/negfUXIIo1VSMb5O8EzG9kstdR/TY7fCYQFbAAjTmWL4OphLPHP
	HibJ0gQ3rCWCdBXOHvx6jVDAeqanoBvm8WNiygGNXkbpzk1WiaHOTq4+koNBvMrHX02ZAgly8Pc
	MQ+eQ+slw4vCIwVzFX8SvVOUp1ElTGo8/O3/Jo3UKqRRm5eFcH6FngGmzH3PriHUQDQanE+pEKj
	Ajt0WuztMJYyB/Cc5mmt07FJmOYZguT/qDDVGg5YvAhMUMGuH4gghjW6fOVCcT4/lC2E5Ot7joK
	822V3n0++4b+uW5
X-Received: by 2002:a17:903:1a8c:b0:2d8:d4d1:313d with SMTP id d9443c01a7336-2db1267bc0emr294219495ad.20.1788761195085;
        Sun, 06 Sep 2026 23:06:35 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae7637sm39485515ad.79.2026.09.06.23.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:06:34 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH] tracing: hist: let values keep the percent and graph modifiers
Date: Mon,  7 Sep 2026 15:06:30 +0900
Message-ID: <20260907060630.481398-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907053113.1CED91F00A3A@smtp.kernel.org>
References: <20260907052113.430818-1-donggeunyoo.kernel@gmail.com> <20260907053113.1CED91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 05:31:12AM +0000, sashiko-bot@kernel.org wrote:
> [Critical] Out-of-bounds loop and invalid pointer free in
> tracing_map_destroy_sort_entries when stats allocation fails.

Confirmed, including the reachability the report points at: this patch is
what makes that path live again.

Reproduced with the stats allocation forced to fail, reading the hist file
of a trigger with a .percent value:

  BUG: KASAN: vmalloc-out-of-bounds in tracing_map_destroy_sort_entries+0xa0/0xb0
  Read of size 8 at addr ffffc90000045000 by task init/1
   tracing_map_destroy_sort_entries+0xa0/0xb0
   hist_show+0x6f7/0x1df0
   seq_read_iter+0x2b8/0x1190
   vfs_read+0x176/0xa40

followed by a fatal page fault a few pages further. The registers at the
oops give the bound: the loop's end pointer less the array start, over the
pointer size, is 4294967284, which is -ENOMEM as an unsigned int.

Fix sent, with Cc: stable and a note that it should be applied before this
one:

  https://lore.kernel.org/linux-trace-kernel/20260907060323.480728-1-donggeunyoo.kernel@gmail.com/
