Received: from mail-wr2-f1.google.com (mail-wr2-f1.google.com [74.125.225.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283CC38330E
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 19:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711133; cv=none; b=qr7NjdxP9Ma23Dzj4CR/X940waY4yewwOSChoBXXh1e75acZyTh9nod0DcWoOHrOHKNvlnxwJRNtKmMC26gV1pOniKGnZMxzVI20LzG0Q0Wfx/j1rkHABMRNIgUoTzonAvfMTChl69Y/Oxl4sb1KBjljNXJVk05ut9v8adqP8jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711133; c=relaxed/simple;
	bh=tz5l1P2egXZ+99pX+TrYhBbm0hYsBmZPTPE5maYt1kM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=lqBFk/PQEA+zTqW/+Fp64tKiQJ34rM7JqXf3ZjnbAx4+li1Xs3+BuERJkFF6UV4RydrsVJKymnkpcFwBnqkRqBYZCWvUHPuWKx3e/5SuhV6Z+Pc2qMIx7q4XkZKbSZKH49zWpujB9AoikKIZ6Yai8ubfHGJk/RWprb4I7vkOtAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxVQuJSl; arc=none smtp.client-ip=74.125.225.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxVQuJSl"
Received: by mail-wr2-f1.google.com with SMTP id ffacd0b85a97d-473b8c0fd5aso400788f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 12:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783711129; x=1784315929; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tp/39SgrHI5z29550UsltrkPPkRKtfmpmPjcf1jfZbw=;
        b=JxVQuJSlLJiM25WzVQXWC8skd5V4+OJ/K/jdx+7hdsL9lcIy9xWC8cSlwSNLjLHXyY
         yEs3/SGdIKzFO9VjcUKsrZO6tNyVDWkyZ1I0imN5/FHHA6IcMkY885tdKBALQaaOJDM4
         9Yn1ph193Zjg6UmslGsLtZp5drVhZohxaZyp+qz14BPWBVYDunqtBPFrXtq8I4Y9/mcc
         S81gzdhRTpJY7tmHoOGZ/88v9z0bHkfalECaDAwQNC/ZYeFuEasmWha8mqC3jX4lxZ90
         IfSVqs+KerCaQGKxWmjrMyBpTgGI7M+3dc9o4iN1vkTLf8HJGnDryXQOK99KnquGbeB/
         WWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783711129; x=1784315929;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tp/39SgrHI5z29550UsltrkPPkRKtfmpmPjcf1jfZbw=;
        b=H3ICjUD4bOjn6m6va8VQn0XbVAPcHMCg8uEokVIgGlJ5PdQPtM1ehugJpCLNikuS5i
         udHQM9W3SK4ZwQ9Ex9JFpCVZMGufHwnWKlm5/5Ea0/HT4/hgMPzMVckwBFNCOLrdd7p7
         NoTMIJKQ7kqeb8uDcmFbJo1ryxgL70wNVLo97Oxud1HtvD0N798H4Cmp1u6Gc0v+g7Bo
         jh1yZglD5qnrlQ0WZq/Y6tqecbQCxhyBc2ybOSo9briXGYvQAaJ5/jQloPmiFU6dwBby
         h2ycqEBqW5zcxBOsZ3HKEw5z6zvqSgkqKTfxzeM+XvZw5etblMbkIHzAvlEy1yrxEYOg
         YPfg==
X-Gm-Message-State: AOJu0YxD9c50bFK1DsVzr5ZRKWDO/2kpgs08GDphPZcuQ1nPYbgQ/rBQ
	yBRyE6QAjEw4e2LkKYMuVar/FHeZfcBdKNMmBV3XHxfxXkRVsP5mvj43uWLK/scZ
X-Gm-Gg: AfdE7clAA1jTW+1/6jRGpy8DPvTvKSI1vomza/4u27dNhACBSAjY381oQNS4YOVBDc8
	Gi0Q6RRErzzJ6p69RyNzpTXHuXSw6xN3xdw5kqNLEmPGDV7ZY/gap68CS1DI+X+QJ38vJBQp3Vw
	feOXeuoQBcnY8Q2/McsfJV1O29J9PiFGA7AOJ4+nQe17ygUxKgoZ1oG7iP9CTla/RvS+jvX6Jpu
	h8ZO12p9cjb5DGzTLDMhzmGGsg+loWjXcGdoniyUzuZ18v4lp2isrEsZwOaVhgAbBKAEgcC4z+h
	WyRRtg4YVDt655/MIjftdVa+g14xKJ56TdXW+vWQZHB4f/9KRQQw8xI0Qc0l9g7VHe1XoHJnT3O
	UTfpKhAh+dqGi+wxNTDIb7tSmqYtiDXM/pFDQF0ALlBhedhviVfrwAqAYpACo8m21aYSYqmn78K
	85Y+2BwHEVeFQ2gufi35cXJ/VGmMZjpWyg5mOnDVYkogPvdKQiT5qXolh91hgVAkOHjjhOaJMgu
	Mm9lsovy+DE6cQDcEPqgufZ4N9ZkgsQu+pq3Vi70cj/EJe6WfNibKA=
X-Received: by 2002:a05:6000:2912:b0:454:a41f:d082 with SMTP id ffacd0b85a97d-47f2dcb3f2fmr79469f8f.3.1783711129397;
        Fri, 10 Jul 2026 12:18:49 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm63392320f8f.15.2026.07.10.12.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:18:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 21:18:48 +0200
Message-Id: <DJV4TO9OH6AN.58C10SBPE8FF@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Nicholas Dudar"
 <main.kalliope@gmail.com>
Cc: <bpf@vger.kernel.org>, <sched-ext@lists.linux.dev>
Subject: Re: [PATCH bpf-next v3 1/2] bpf: Require a BPF cpumask for
 bpf_cpumask_populate()
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260709182800.2037938-1-main.kalliope@gmail.com>
 <20260709182800.2037938-2-main.kalliope@gmail.com>
 <20260709183918.E42371F000E9@smtp.kernel.org>
In-Reply-To: <20260709183918.E42371F000E9@smtp.kernel.org>

On Thu Jul 9, 2026 at 8:39 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The BPF selftests and their headers were not updated to reflect t=
he new `struct bpf_cpumask *` signature for `bpf_cpumask_populate()`.
> --
>
> --- Patch [1]: [PATCH bpf-next v3 1/2] bpf: Require a BPF cpumask for bpf=
_cpumask_populate() ---
> commit 79080c077263fb184f42fe92f3d8db1f3967a4b5
> Author: Nicholas Dudar <main.kalliope@gmail.com>
>
> bpf: Require a BPF cpumask for bpf_cpumask_populate()
>
> This commit changes the first argument of bpf_cpumask_populate() to requi=
re
> a struct bpf_cpumask pointer instead of a struct cpumask pointer. This
> ensures the function follows the same ownership rules as other mutating
> cpumask kfuncs.
>
>> diff --git a/kernel/bpf/cpumask.c b/kernel/bpf/cpumask.c
>> index b8c805b4b06a0..1336a4efa7553 100644
>> --- a/kernel/bpf/cpumask.c
>> +++ b/kernel/bpf/cpumask.c
> [ ... ]
>> @@ -467,7 +467,7 @@ __bpf_kfunc int bpf_cpumask_populate(struct cpumask =
*cpumask, void *src, size_t
>>  		!IS_ALIGNED(source, sizeof(long)))
>>  		return -EINVAL;
>>
>> -	bitmap_copy(cpumask_bits(cpumask), src, nr_cpu_ids);
>> +	bitmap_copy(cpumask_bits(&cpumask->cpumask), src, nr_cpu_ids);
>>
>>  	return 0;
>>  }
>> diff --git a/tools/sched_ext/include/scx/compat.bpf.h b/tools/sched_ext/=
include/scx/compat.bpf.h
>> index 87f15f2962348..3f74d522f7e79 100644
>> --- a/tools/sched_ext/include/scx/compat.bpf.h
>> +++ b/tools/sched_ext/include/scx/compat.bpf.h
>> @@ -84,7 +84,7 @@ bool scx_bpf_dispatch_vtime_from_dsq___old(struct bpf_=
iter_scx_dsq *it__iter, st
>>   *
>>   * Compat macro will be dropped on v6.19 release.
>>   */
>> -int bpf_cpumask_populate(struct cpumask *dst, void *src, size_t src__sz=
) __ksym __weak;
>> +int bpf_cpumask_populate(struct bpf_cpumask *dst, void *src, size_t src=
__sz) __ksym __weak;
>
> [Severity: Low]
> This isn't a bug, but should the BPF selftest headers also be updated to
> reflect this new signature?
>
> Looking at tools/testing/selftests/bpf/progs/cpumask_common.h, it appears=
 it
> still declares the old signature for the kfunc:
>
> int bpf_cpumask_populate(struct cpumask *cpumask, void *src, size_t src__=
sz) __ksym __weak;
>
> Because of this, the tests in cpumask_success.c and cpumask_failure.c und=
er
> tools/testing/selftests/bpf/progs/ continue to use explicit C-level casts
> from struct bpf_cpumask * to struct cpumask *. For example, in
> test_populate_success():
>
> ret =3D bpf_cpumask_populate((struct cpumask *)mask, bits, CPUMASK_TEST_M=
ASKLEN);
>
> While this doesn't cause runtime failures since the BPF verifier matches =
the
> runtime register BTF type instead of C-level casts, updating the selftest=
s
> would ensure complete consistency with the new kfunc signature.

Once this lands, please send a follow up to address this.
