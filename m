Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41B83EA955
	for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789899673; cv=none; b=N0LBx99ot2Ug1+fD6rsisZOPLbIt7yMvNTRDQTnvtJPyekWM3eIkYEaVfThCLtduhryOt8pYH5n2HQcgw3WgF4BwsFFbMENa1K2ENI9c2X6I4Hud3sO2uMEr8XRl74fsRnom01hH4N99UD24ni+MOUN1V8R83qaNvBqfcfMHESE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789899673; c=relaxed/simple;
	bh=DXs70q+uj0fOTubAL/yj2nRY1q+Sd8JFHOY3sHHBGhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IKQN4uR8Oc+WN5E1XTNGSN+nl5gjeVpVzEheNNRzEPghKGvtrkQa3IVinnljQZfYnzEkBU9gB4DHQsBp/n9tXjeVzEG/SV1bBFKqFHS290YAjlMkv0ezFSte7GDYQAnq9iQdqu48Ak8NpBFdIz7wSNgzdfv3mXJGP4B++pCSkHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tF5eCQxb; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tF5eCQxb"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so25465865ad.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 03:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789899671; x=1790504471; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXs70q+uj0fOTubAL/yj2nRY1q+Sd8JFHOY3sHHBGhE=;
        b=tF5eCQxbSuC0+Gaq8Y4eHIy3Jt3Y9RWofgqczixuf4XDZrbV7Em27upImxGnXSBp8r
         h4VqKDweonf6Nyh24JMaIbkizhXJZARr4iwfKosU4uvF/VSc0t15K5tPz3S6bAmeQiJy
         XqDFupt3ysv9v7WFYKByJmC2XBVVyafSvXRdKsbHcZq3qtacG/d+nR+kV+Nm1Y/nynxo
         lLXnwndHo7Aws43ZEVy5t4UslPqbQQc9uPdN4X2ZNjS9G+UIzURKJMqsjdhGwVSbBh2z
         wCH4HGXNopGiuM2Bhl/i8nlgsIct5klA7OlNMLedg2d05IEQEWGBdmlnPNtb2O74PbFs
         Svjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789899671; x=1790504471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DXs70q+uj0fOTubAL/yj2nRY1q+Sd8JFHOY3sHHBGhE=;
        b=yN8Fgy3xfbqz2RDbxWC2VzqQavaBxPq213R3oSLowuvs5BM6HdR8EER3nnvWhLLz/M
         4UcpBTLd3o/CRhp8yWB7MOY+sIKYQ0KNiUxdjkb8q5T6R4unfWIDNYmmJ28lDWBPofgZ
         vaAWl9yq5S0ct3D2RXHOe+AmCRumu//pRBwlhYikYyp7vKFuS3aKRA1eh+tLIt2T+l71
         lpK+AcGGrfg+HYzOZ2v4xdIMDEnshsfg2L+XbmkLZ/rvAFlb8SoPnRJ1/29It4SXS97v
         Bh5iYeX/JdBz0M+WY7973gRHmD8P424/uTifvV9PLC6Nfj4BdbycF06lEa0j7BLYCHS9
         HVUQ==
X-Gm-Message-State: AFuF++mT0Lx4Ps1DctLaqfASFBLjHxvFC4+/nHtqNe0gHnG+LowuCnkW
	T1hPldHLBkpQ39iaFljRgx74bQ7dTZxAC+OrSlVpgq4hUtGLTby0qitlh0ld270=
X-Gm-Gg: AYBFou03CzezAJAmAx5BYawHeg0wPBSOsZ2ZHaOgv6C/ZzEU9mcb7ECW8XoTSGDvOwW
	72aQ0uw09X+j3IzBeix+ysnGaXFwcLnH+/d66JvwdiVTsm4y6yaQqHfwIDJZckUsKsC6Ldb3SSG
	azuhGiG5I2qE+PBYBVls/kBg80YAtFH++Uxk46dUpHinUFyLPWcceZWOYWfLLsVuZgsaPDgyQli
	s8HEi/mAMOB7Ogk3M/+H8UYsIL96BZ4ji7v8r0ZIz2uqMcj6ixvn25Sy6dz7jIYPe0FEGRJvkMI
	5ge+4QxabTHBxrCHYe9jrVADR22r3iwxmrhy7qrXNT0LNOxhh1H08vSS9tcY3SBnbolwUAc5nJ2
	u71nSV8tLg2Qxd+WqHGomVsJqkyW1WKZ5C1w5IL888cA5yxtakLHCVGt0gJsFmf+qTsLst5EXnm
	cS+h+L5Bci1espWZokX2HdfKuZQ0Hk9B1sA4W86Nsvv7MxxD5gccmWGsZYC3elfOLH9XZdvdOwy
	4HE4ZUl7e5gAcyFRruaLrYbUMM=
X-Received: by 2002:a17:90b:3a43:b0:39e:6c68:c778 with SMTP id 98e67ed59e1d1-39e6c68ca12mr6544339a91.46.1789899671224;
        Sun, 20 Sep 2026 03:21:11 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:e0d6:4b87:c472:c9ae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c37a88csm8550850a91.8.2026.09.20.03.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 03:21:10 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH bpf 2/2] selftests/bpf: Test per-cpu initialization of a BPF_F_CPU created element
Date: Sun, 20 Sep 2026 19:21:05 +0900
Message-ID: <20260920102105.445051-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920095859.635921F000FF@smtp.kernel.org>
References: <20260920093153.439743-1-donggeunyoo.kernel@gmail.com> <20260920093153.439743-3-donggeunyoo.kernel@gmail.com> <20260920095859.635921F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 20 Sep 2026 09:58:58 +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Does this force a hard failure on uniprocessor systems instead of correctly
> skipping the test?
>
> Since UP is a valid hardware configuration for running selftests, if a test
> requires multiple CPUs, shouldn't it gracefully skip using test__skip()
> rather than asserting a failure?

Right, that is a bug in the test. With one possible CPU there is no second
CPU that could hold a stale value, so the case this subtest exists for
cannot occur; booted with -smp 1, all three of the new subtests fail rather
than skip. I will use test__skip() in v2.

> [Severity: Low]
> This isn't a bug, but the BPF subsystem strictly requires multi-line comments
> to have the opening /* on its own line. Could this be reformatted to match
> the required style?

It is not a requirement, but it is the documented preference, so I will
follow it. Commit 82b8000c28b5 ("net: drop special comment style") removed
the netdev comment rule, which leaves the general preference in
Documentation/process/coding-style.rst, and that is the form you describe.
checkpatch checks neither form. I will reformat the comment in v2.

Thanks,
Donggeun
