Received: from mail-wr2-f2.google.com (mail-wr2-f2.google.com [74.125.225.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC2A2EC09F
	for <sashiko-reviews@lists.linux.dev>; Sun,  2 Aug 2026 23:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785712153; cv=none; b=QaroMgDTzbLnlyRlLA/E167iXXLthGf6+5dEMvwkP2c2O9wSpWwDoRHudKeNr2/6vtDp6IZlos0gzl87+vktZ89kWpQimFSROYpEahRR5E4/cgoST4gjPUQLz/IEvVaYhr6YFnn8e4rFwkAFDhSYbgZ4mRT9WT1IeNy6xcEcQog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785712153; c=relaxed/simple;
	bh=RX1VMfBz7J22ekT4x+p61ELsTSvDTroV4KGXGIm1qp4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=mAZYBOsy2Xbn1fWaYFM2vE5ZG6F6luF+yr4Xdr0Sn8fDcTr6bYCsJlS015+RIft/fS9it7zKk37CKHxt6a1aipXLRVkvEzcbVIxY+VSXTQnH5NS7zTA6LYiIS2Cl31HeKyx1CWU8dMszuALfdUQ4vfww7i2gV5+VY12duVkW3ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyLd/jci; arc=none smtp.client-ip=74.125.225.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyLd/jci"
Received: by mail-wr2-f2.google.com with SMTP id ffacd0b85a97d-470713a9053so801958f8f.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 16:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785712150; x=1786316950; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lfeEUlf77ZiQWMgQd598a4lPStxyxdqvSqA/as60x8k=;
        b=AyLd/jci7p7VmAykiM5EtNPV+6qGwIFijNI+rWb6bXmSet3Rk1qsNf9Ndth/NqIuxi
         uPbhnBfzxL0XLTKlU40HG5E03OEWX6DLPQuBBricJoj37bDbcup9/LoM+TrpS1a4/0wu
         IYUy3bQxqJr6kaFsGyCDmtvLdz90+TQN6EjBdHWe+rM5mQkzWqmPEE1aZQrSSVPKYBV4
         A/t7NoXCihk1zdrT+qbTZZOA6f0MSAUMpzgyi6fSk/KjPt5+zRBTD7QYptqQAJ5NZ5xX
         H+K+K8/U0H+0NN7UcCCkJm87N02nlGPP6+mi0WZE3v5dXO8N/LhdGT/D5K7Uk3rKnj5r
         rJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785712150; x=1786316950;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfeEUlf77ZiQWMgQd598a4lPStxyxdqvSqA/as60x8k=;
        b=jjvI9cwVWoNhWRDZbdhWPU5zatcwUX4PWiGtD1k+oBhilkVITIFVsTRRuC2AILOU7Z
         qhgWP5eewk5dkY4dEt+cmAZbI6aPsrGkbE4SiWXArZE4HhqWbddLRNxrQbh+hmTiLLoE
         q4y281JYtMBW0NwdD7JR5rObwMUgfhPZc1pGJoH1hq5M1JhXumjEs66fUT0HjHOMFhBv
         vXIPFMruSa+AbV8o/QVFh1b/rWgIqhwAlft3L+2QvAUTzlLSbhyv8Jvf7Ve8MdHiNkPs
         6ua2B8F5xiS+qOHZmdDq/5jGtzCke7n/btBfWS5ERczQKj/gkvmIxV3GcF5CEpOFjsDb
         KExw==
X-Gm-Message-State: AOJu0YxMuc5/yDd0MpvhmPseNr/NrobvWauRDUNEUPrnh7/tUzismQVV
	xg2zv32mZ9xdiQAE6PJINkU7ERgN1o/DFMfrVt0ul3/e5rYbyDzwG4fZc0Iz9ivV
X-Gm-Gg: AR+sD10cN9QR2r8V33DNz6kpKMK6mqb5eVjvdZ6mICa2LpuTcwgclH4kKpdMkJFi/r3
	ZtKaZ1sxEwLb4jmk+PjIbh2lEoaATVIJnZ262EVtbATDV6BDC7dQlG56T0Im3rX3pAQBeNhIwVX
	L6XWdD9i/i1iWiFinC2Qhu0cLgW1R6xQQKSS17fCYgq0FkkqfjepnysGZbUCNn2CuLjeV0TlJ35
	N3+yJuQngs30jdo7z/PtlwBO2uCDTlS4CRGalaFodPqGRA6g4tczTgrPxbYmDP15fLZwAprvzNV
	CbHITffVdTrSbVMzwTW2+AC4qodkERLTNQTZPdRgsx89ovlNUoUnF2ThKd8ubW5XcnkC+WGyGTN
	3iyL+mPmfEpesibm0rMihFsKStslSgGQpcf88lgILMTOG9flCcuvz22gxuIMX81VivJT0Sd8frH
	oBM30bqS3ZY3enkgMq0eFZqqTjobPqn7avMergS57uOBaf1R5QWIOMcbppCgq7t3AOELRDZS8Ox
	yalZ5rbdzE6tqap62KDPMkwA97FUJhXmWYgm6VYF13jMCJaxLJQoF1ExomehGXnooO5CRy39yYu
	33h5/zqV8iaIvLKonaoGKWlvtfsD
X-Received: by 2002:a05:6000:178d:b0:47f:86af:8fdd with SMTP id ffacd0b85a97d-47fd72c74bbmr18934300f8f.3.1785712149545;
        Sun, 02 Aug 2026 16:09:09 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a5a4sm27561230f8f.20.2026.08.02.16.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 16:09:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 01:09:08 +0200
Message-Id: <DKEU4K708GAQ.2VC887YB976SN@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 1/3] bpf: Show more useful info in stack
 depth stats
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Roman Gushchin"
 <roman.gushchin@linux.dev>
X-Mailer: aerc 0.21.0
References: <20260802225209.2511758-1-memxor@gmail.com>
 <20260802225209.2511758-2-memxor@gmail.com>
 <20260802230435.7F4331F000E9@smtp.kernel.org>
In-Reply-To: <20260802230435.7F4331F000E9@smtp.kernel.org>

On Mon Aug 3, 2026 at 1:04 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The commit changes the verifier's 'stack depth' log format fro=
m a single-line format (`stack depth %d+%d...+%d max %d`) to a multi-line f=
ormat (`stack depth max %d` followed by per-subprogram lines). However, it =
fails to update the `veristat` tool in the BPF selftests, which relies on p=
arsing the old format to collect stack depth statistics. When `veristat` at=
tempts to parse the new verifier log, the hardcoded `sscanf` string (`"stac=
k depth %511s max %ld"`) matches only the first word (`"max"`) but fails on=
 the rest, leading to broken and unpopulated `STACK` and `MAX_STACK` metric=
s.
> --
>
> --- Patch [1]: [PATCH bpf-next v2 1/3] bpf: Show more useful info in stac=
k depth stats ---
> commit f4a761d5dad941fea12558fab4093ec6ef3e52da
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Show more useful info in stack depth stats
>
> This commit updates the BPF verifier's stack depth statistics logging to =
print
> the maximum stack depth and each subprogram's stack depth on separate lin=
es.
> It also updates various selftests to match the new output format.
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index e6f35f4e715b6..74a92036d84e7 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -18703,10 +18703,15 @@ static void print_verification_stats(struct bp=
f_verifier_env *env)
>>  	if (env->log.level & BPF_LOG_STATS) {
>>  		verbose(env, "verification time %lld usec\n",
>>  			div_u64(env->verification_time, 1000));
>> -		verbose(env, "stack depth %d", env->subprog_info[0].stack_depth);
>> -		for (i =3D 1; i < subprog_cnt; i++)
>> -			verbose(env, "+%d", env->subprog_info[i].stack_depth);
>> -		verbose(env, " max %d\n", env->max_stack_depth);
>> +		verbose(env, "stack depth max %d\n", env->max_stack_depth);
>> +		for (i =3D 0; i < subprog_cnt; i++) {
>> +			const char *name =3D env->subprog_info[i].name;
>> +
>> +			if (!name || !name[0])
>> +				name =3D "<unknown>";
>> +			verbose(env, "stack depth subprog %d %s %d\n", i, name,
>> +				env->subprog_info[i].stack_depth);
>> +		}
>
> [Severity: Medium]
> Will this break the veristat tool's ability to collect stack depth statis=
tics?
>
> Looking at parse_verif_log() in tools/testing/selftests/bpf/veristat.c, t=
he
> parser still expects the old single-line format:
>
>     if (2 =3D=3D sscanf(cur, "stack depth %511s max %ld", stack, &s->stat=
s[MAX_STACK]))
>         continue;
>
>     while ((token =3D strtok_r(cnt++ ? NULL : stack, "+", &state))) {
>         if (sscanf(token, "%d", &sub_stack) =3D=3D 0)
>             break;
>         s->stats[STACK] +=3D sub_stack;
>     }
>
> With the new multi-line format emitted here, it appears this parsing logi=
c
> will silently fail to extract the stack depth numbers, leaving the STACK =
and
> MAX_STACK metrics unpopulated when comparing regressions. Does veristat.c
> need to be updated to match the new verifier output format?

Hi Roman,

I think Sashiko should look at patches later in the stack to see whether th=
e
issue it is pointing out will already be addressed later. Bisection related
concerns are different, but this (and many others) do not fall in that cate=
gory.
This is a recurring source of various reports now. It isn't a big deal, but
would be good to improve upon.

Thanks
