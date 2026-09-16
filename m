Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D404D6C59
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 16:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575325; cv=pass; b=VmFqh+dhtnEJQjU7EcroLqsHu87bFO25g6BIYxxmqDJ3HYuK14hiwj+QZ81UUyc4UrmRV+DeA3beIMUTyAoIMH+2aJL2Dv/jymB40a5KwFWR9xMHY+yqYDpowKqALVWOIozJ0k/D9QtAaBSskAtdZIvsMRuvYADBonUcGgUIcNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575325; c=relaxed/simple;
	bh=W/UaRW9VDKZ9nC26IGoc0xEyycGn8uxQTbeedJaZEmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s40I5sujJGjGqkUX9jiUjRg09pqNAtbg1G9qZ7gf7f7czEkMiG8YLbA3LTCplEMJO5pkbul0gGpinpZM67+EKZtIHq+9EPz5I6AkTevWgkRfHQBEeQhFtSElkrZRrOBKFauoyqUdhO5ISiaaxWYkUNAGKKoDYja3R1/yUzghtG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com; spf=fail smtp.mailfrom=uber.com; dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b=QZSSREa3; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b="QZSSREa3"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-8659af7454eso13250147b3.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 09:15:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789575322; cv=none;
        d=google.com; s=arc-20260327;
        b=eNfUncn42G60YA9n/uJDoKNydD0s4gpA7Ew3Ih/r7zb1wj35EF5YNfW+uEo+DXwf8x
         aEek84mp9/5wbYdDKafb1brOohtAqtkQr1n4uDkc89v/V++HwtVSrxrOXiJqLXmBqaBL
         wRZKocaHSx8BMfLAwsgsrX3H5bs9FB78dGcUQcg7Tt+QVTZXeJsBseDJPG4R1ArgH9Ik
         J310nFyBwMcfReidaFFgEo4vyRZ94QccOP8qRppVbvojQNVIYBSP19T+Q/MYQnF/avDM
         tg00RL+I/t6/8lNbsnZRilsTBabG4f4GtVSalDsUEE6wE6DgsF7I/t7ur/KJEL72LTye
         viUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W/UaRW9VDKZ9nC26IGoc0xEyycGn8uxQTbeedJaZEmI=;
        fh=0zVHGC//SC94CWFKHtFt4lnskmkXkJNNy7lE0FDd3Ck=;
        b=LKoDIlwMoWZZMFbrMdSolzPJ4UNbB0JfEOB+qfYcfBH4laS7//TUdxPzW138YArWxB
         6zJfjLL2hWPpNpmhK3ptugNvyw+7vuUYxnAWtiCpQjgZs+At1dY8/1WtGfn0VYxGfPLF
         YDuLHezTGHVrRkNzBtkiffnKDLIyhPxPXyVUgxgLptxYfwgZCoAQnb2OMtTO0ThCCSk3
         sxMrgbrlKmte5N4Z9NjowPpsNV8wwlW63eLAK1DBqslWSdgzwflibhIjoXL3QawTvdii
         TJUBDDBNry5geTCMopPKe6lomjkJmDA1dHyuRbujnDKzQ0/1tBmdJlBA7n0OZnqSRAO2
         +VwA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1789575322; x=1790180122; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W/UaRW9VDKZ9nC26IGoc0xEyycGn8uxQTbeedJaZEmI=;
        b=QZSSREa3MZl9kFxJICLtFlpUfeMydLE2RCdydh5p2c9s+XuQ+8iIVVIUUrPcmf1dK+
         YM+0otK6VzbPikNOB1EGqV9K5IQkNonooEzJP9EWy1A2G/cJ+Gz8YZ66L9qG8h25pztQ
         1ggNwN2lWJCfhiAl3Qjvp5Q9vxgsi2FP5fdFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575322; x=1790180122;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/UaRW9VDKZ9nC26IGoc0xEyycGn8uxQTbeedJaZEmI=;
        b=OVak8lt+YtJ7Ljzo72Wjc6vg+5xO0kZzfoe/XM5/Hk82y8E78grWknbJtVDpURoXCC
         cndAd3WOMgXy4TWh/NP2IizytjVlgA/U7X9fb3OTD4+9yHAhiVyQoB3/sg3XvZyg+erl
         NEEfsj0Mu1zv8XpDuSmy5pj2qyemfXBGaOHhOP5sbu2+bpVIvPtU95twXgwC/opELDOD
         ofABW0RY16UaEHvSGt19NCxW1Ph+aKi09SmriWXZ1twVfspi0tPSuZrd7FqwyGQSpEqe
         pZS558fIH8093gl8WQww9PDFixe+2A0xlozF/43XuWOKR5BoMPKhyvfW6Jjp6xpumAkn
         ld0Q==
X-Gm-Message-State: AFuF++nFjOtp7ryONZ5dfTldVauJjI6MHO5wiqS9XswOHGtOb5ZI73TE
	U+PpY5uEwcdgAweA/qlS/JiVgkArQyuc3jpVl2Oh9MdKLImaorFzwHHXSowIGkPGrD3M8THQRxj
	d0LePq10bBXE8wAhpRslK9N7M4KFrC3sTM3WDAM0uI9CUNYtnm4Ia49p3PQ==
X-Gm-Gg: AYBFou0NNmd/msFjGLgF4taad6qPAb3B02HdMMSqQELqnDdJkQORNBgngcS9gBkr/ax
	j/H0qzT/ksj2nKfZuav/J3szCWnk+BrnbC8sk4SUCepGnc+NuFtJrG12VKQMQb7y8BO1ITLWoO1
	9DHH6jaF/s8wUb0tVqyYvzMo6p63OLpOmjMhdTeA4M+61zvxO9jAU7KpCgIdZxiM3JhSqBk8UWF
	/PRVPS0h3j1rCZPzUoa5OyIzri+NVcyk1a4OcxHlGFHAe1syNUC3sncA9b0P9VIwkZptF8kqZi4
	FgQYTdPiLDZEiRR+vbck4FOQMWDxtSA5p8bvz0cjFgFOIWd946Y6WQx6Kr5ZgV1aDVpqHUgYxLX
	8Y+iwDJ+BQWw=
X-Received: by 2002:a05:690c:e250:20b0:873:5c0f:295 with SMTP id
 00721157ae682-892269d3f41mr7600217b3.63.1789575321506; Wed, 16 Sep 2026
 09:15:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915-perf-symbol-memory-send-v1-0-1d3360e21f07@uber.com>
 <20260915-perf-symbol-memory-send-v1-2-1d3360e21f07@uber.com> <20260915190132.9B2131F008A2@smtp.kernel.org>
In-Reply-To: <20260915190132.9B2131F008A2@smtp.kernel.org>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Wed, 16 Sep 2026 09:15:04 -0700
X-Gm-Features: AcwNN1VMfAW9tyGy3MAW53y0Y_4rMhNKLpGNe0bKvVhbPRWeSPKrItVa4Bps7AI
Message-ID: <CA+w=M=QMz7vMtNwUbObzfQO-6A9Xe-tuUrj-LU6i13UDanOSkA@mail.gmail.com>
Subject: Re: [PATCH 2/4] perf script: Add --max-symbol-bytes to bound ELF
 symbol memory
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, all three findings are valid.

I=E2=80=99ll make the global accounting counter atomic, ensure that a
budget-truncated symbol tree does not fill ranges containing omitted
symbols, and use the full stored name length instead of the truncated
u16 namelen when unaccounting allocations.

I=E2=80=99ll include these fixes in v2.
