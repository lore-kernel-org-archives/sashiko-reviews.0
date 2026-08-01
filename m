Received: from mail-wr2-f0.google.com (mail-wr2-f0.google.com [74.125.225.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB34B489882
	for <sashiko-reviews@lists.linux.dev>; Sat,  1 Aug 2026 23:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785626120; cv=none; b=G+aXezLJqCP2x55pOYE8e8B83P6XJEI7NDdL+LtV7TFnpzjiQxDXDW/hhMUC25yCJBfXDV0OhDJAi69AMaIs5HPB36GoHUvNoJOyhQDnme7Af311u9gg/LkFLQ30t0/+zEc+qfb9VP0jr5faOC94xRFASG3audR0PRgp0cdYpps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785626120; c=relaxed/simple;
	bh=uYWMWTB2xfhuBvHHIxzDNU0Hyt+RGxbNFHvWkvXIEGg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=V270VybSOED+DupH+wjF0yQY63MAkbeQwdK58kfn3v4ygHN0ht8BzCEW062da4Buccog6wD/Y3ev/aFbjz6G7eHlDwgCk1dHJiVwLzrTAQ3q5xglCzR3fgtYYu0/BUuTdbkyODet+TmRmPJc/qhI8cwkXFJ+4fNffEDjhPcQLlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgQbcXe6; arc=none smtp.client-ip=74.125.225.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgQbcXe6"
Received: by mail-wr2-f0.google.com with SMTP id ffacd0b85a97d-47f4c92d1b3so569974f8f.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 01 Aug 2026 16:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785626117; x=1786230917; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UDVgfDsUWPp4vaDuL46w9X9y1PG9/aWOLcGBDuH/lFk=;
        b=EgQbcXe6m6x5w7r6FNn2ADxjm54dFvVkTQFT3vnulkkcrR9pRZp5sWQfo1AM2YH8cX
         LqrvWIzGmFS+Rf4HjnWkYmj1QxKjRTbBXASAdE0NupuPijvR0aOOMu7dLVghS8B8G3zu
         /lnQHZHaYBkNb/3knt8drwd45GyJXICT9BKAl+xNq2FugzigpGMKXhkCOy14rlottGQU
         H+JQlZSwuWvFY5dW/F41jolMM+bby9s3lWwfYo6ewuxo61xBSyJdxwtgqmDBundeoT7t
         kxtMYyyKH3nIqCJwjPB7dkS6tvGlCEbtHPTvcb4oHYsfbdAU/ogkkP8ZjeCWzXNh3HhM
         2wRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785626117; x=1786230917;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDVgfDsUWPp4vaDuL46w9X9y1PG9/aWOLcGBDuH/lFk=;
        b=kODnzTIT8xpOcCUUhmQc7oscR6W7JlZk+wI4m6KvAkCTsbIPYh9jc5D0Mzpu4Pop+z
         AIJpqE5FdJYWTSttjWz5Gd5eeBeva+szPwPDWmcNgOEJ7RHIVtv12AQPbRnlNnI9S1PN
         rJ/GxY+1RRdS9chkmWEfaJfDxcCKhlzTZ9QlpHuj3EzDiJXjuaBY/wlnPAzsDrJToYP9
         ZmdRxWmMwojc/lfEOv7WNuqCcHFjSwRpe0tNKUJcrbCHMxnyH4YphAZaV+sG3zoTPHGF
         yU5rwqaRHFrMwQYueSCoI4bS3hte0MPMYLgkFNyKJ9X9so0sqxEoHwBP9YWg5V7PvcRg
         0jsg==
X-Gm-Message-State: AOJu0Yw9a7f+zRIKrvYXFdJRUN7rajymJD5bPffEYpq9hb6fbMteMQi+
	y7AbP92IzpA9Zt4J9QNGuLemhUkqjYnGn1yD8ghl0/j7uFBX3sypBZZuyQ842+Wi
X-Gm-Gg: AR+sD13rF4eZN0YVZm+haXxiNuoALsFAtc8/OSVOLOkJ11X+q343EgWGtNqc+UMX30W
	AOQ37WfinbmFdKNV2/BXYnc9brhcNL8Eve3inXrAsHCK4nGwmiE7a927OAzsDaxy5+hH0S4HWj/
	sPJay5qPqedJLONmzmFohChWRCEX2WNIhqvn0mH4ehi5EhSmHnsO9dF4TDyAFLA9ebiG/TaqwB7
	lzucdxTNaoEzmzZJipz51q4vZGuMFEyRSh+MDj1vWDBBobvccf2/AZsasq5X0i0px7/8PjBZxt4
	MSArjtRgDbftk4hP1/V32/fzXThnav+FKFG+VnSQEb9KdWafHBKFcSGfn5k3HdwrVdk79YzXtni
	TwfxpIhtDWxH2TUKU8KdOan15QiXoHKjWfq+ubks2zKXYphxgriNYkAxbMb6gX76ce6F1DcNv65
	vehmRreA8z2qL8q4vcnF2C/lB9cHrHuM7DhcAR76e5TWEnAV2vdDlGUft7VMJ1MHOM8E0gN4AYL
	cFMWxYN5ebNBNgYMdTf5+w2O5GKOANLqpQwF1Vg33xUPO6UyL/M1OjR4cY4O99BMypsYWfA1+zh
	h5mnqWsUAm4F8QmwQe2ydUC7pQQ=
X-Received: by 2002:a05:600c:6989:b0:495:6338:1453 with SMTP id 5b1f17b1804b1-4980c680bd5mr94148515e9.16.1785626116985;
        Sat, 01 Aug 2026 16:15:16 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b6093fsm53217885e9.1.2026.08.01.16.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 16:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 02 Aug 2026 01:15:16 +0200
Message-Id: <DKDZMPBQ6PXU.GQXFOI3BXGJY@gmail.com>
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 1/3] bpf: Show more useful info in stack
 depth stats
X-Mailer: aerc 0.21.0
References: <20260801230400.850271-1-memxor@gmail.com>
 <20260801230400.850271-2-memxor@gmail.com>
 <20260801231113.D0B711F00AC4@smtp.kernel.org>
In-Reply-To: <20260801231113.D0B711F00AC4@smtp.kernel.org>

On Sun Aug 2, 2026 at 1:11 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The new stack depth verifier log format breaks stack metrics p=
arsing in the `veristat` tool.
> --
>
> --- Patch [1]: [PATCH bpf-next v1 1/3] bpf: Show more useful info in stac=
k depth stats ---
> commit f7cb915ff02de7a02fe7b2353a1f2d77e1852496
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Show more useful info in stack depth stats
>
> This commit changes the output format of stack depth statistics in the BP=
F
> verifier log. It replaces the old subprogram index-based format with a cl=
earer
> name and depth format, avoiding hard-to-read sequences.
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index 8d0635ee48c7e..51ac0a9ae3394 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -18703,10 +18703,18 @@ static void print_verification_stats(struct bp=
f_verifier_env *env)
>>  	if (env->log.level & BPF_LOG_STATS) {
>>  		verbose(env, "verification time %lld usec\n",
>>  			div_u64(env->verification_time, 1000));
>> -		verbose(env, "stack depth %d", env->subprog_info[0].stack_depth);
>> -		for (i =3D 1; i < subprog_cnt; i++)
>> -			verbose(env, "+%d", env->subprog_info[i].stack_depth);
>> -		verbose(env, " max %d\n", env->max_stack_depth);
>> +		verbose(env, "stack depth");
>> +		for (i =3D 0; i < subprog_cnt; i++) {
>> +			const char *name =3D env->subprog_info[i].name;
>> +
>> +			if (name && name[0])
>> +				verbose(env, " %s=3D%d", name,
>> +					env->subprog_info[i].stack_depth);
>> +			else
>> +				verbose(env, " subprog[%d]=3D%d", i,
>> +					env->subprog_info[i].stack_depth);
>> +		}
>> +		verbose(env, " max=3D%d\n", env->max_stack_depth);
>
> [Severity: Medium]
> Does this change break the veristat tool's parsing of stack depths?
>
> Looking at tools/testing/selftests/bpf/veristat.c in parse_verif_log(), i=
t
> appears to rely on the old format using a hardcoded string and splitting =
by
> the plus sign:
>
> tools/testing/selftests/bpf/veristat.c:parse_verif_log() {
>     ...
>     if (2 =3D=3D sscanf(cur, "stack depth %511s max %ld", stack, &s->stat=
s[MAX_STACK]))
>     ...
>     while ((token =3D strtok_r(cnt++ ? NULL : stack, "+", &state))) {
>         if (sscanf(token, "%d", &sub_stack) =3D=3D 0)
>             break;
>     ...
> }
>
> Since the verifier now outputs max=3D%ld instead of max %ld, and the indi=
vidual
> depths are formatted as name=3Ddepth rather than numbers separated by a p=
lus
> sign, will veristat silently fail to parse STACK and MAX_STACK metrics wh=
en
> processing BPF objects?
>

Fixed in patch 2. It is an open question whether we care about format
compatibility, in that case we will need further adjustments to parse both =
kinds
of output (for older and newer kernels).

> [ ... ]

