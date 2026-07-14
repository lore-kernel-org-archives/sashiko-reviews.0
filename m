Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8972C11FE
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 03:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784000200; cv=none; b=P+WD0ck7RW7/8jSpmp+APYsRExs2QT8wfAHwZhs19HmRMA0B6kIW4ZhxB+7U5g+WdxPsmJNay8WQuxbNvFG7XRC1x4YSl4NrOmy5l++yd1tipYFKy614zam3m9C40jI52smSaXmegQXRE10y4FWq8QHqGGaJjVBxWx50Jp3Ahus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784000200; c=relaxed/simple;
	bh=RLJl2QN0aWmHCCrxH0baI8DlMu2mxkJdxXrW0rQTWAU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=eTSzGGRfKWSazjAnW+/A1o+AFGyZntLKYsQfUB6Cr3l7OCt/pCqYE/GpIPyqYew8H/psyIA284oU7BOIBOcKWZGjKx4fHtkZoXWOQA5xyzZ+YCj7yUtpY2ng1RjRDtMhOjM8WwlkSPfUUqRopRYiTlDOUr/YbXKZkXW+/WG1Qik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTgQs6pC; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTgQs6pC"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84861fc51f5so2116697b3a.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 20:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784000198; x=1784604998; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gAuM5M3KA28cxh47JFCQwmkbYWzL0Rnh2NzqCwCHs/Y=;
        b=sTgQs6pCckBAe26Uwb+9Lzg4S5fUpIvWga0B0lV0WcFX2BwmdrCT0QNI9z2S2NPEl/
         6HCCEMAU7Z2sK7Dy4yUVuRyQp5SqQ6Z4z4Uat8Zp/iBtsf+h3PqACbPEH63JWhWrl880
         exbfZ69GnK2x/8hfKnpsqVyup0HFrbteAPL6TTWx+8EtFx3J90UFRFpPWpffg9OD1FlT
         Mw9BX7BK6wNpSpUBdGZMQg9Y4yNn4ripDkNTM2zdrNNolK7dxujiFlVF+PC3XdPDsB/Z
         0Yb8NEiCR+QzOdiSMDjxN7ukoMhywiDTtzt9Xez7oNpBFzzSOuy2Ef0JZP5+/enNAkas
         tKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784000198; x=1784604998;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gAuM5M3KA28cxh47JFCQwmkbYWzL0Rnh2NzqCwCHs/Y=;
        b=cbnq0GAahKYy7munCeueuiRCjRwiec8diAoLkAuyjlIkTGGXzjG4nBmL1m7KgeLwsI
         IKCJfvS1CYMWGxr3jx5GuFRPowwsfzfNVP7ly+/TW41wUREc1nQ3hAEheSDzITLNLYdr
         Cu7lAaGkK7D+6BGH4h4NJ5+icA+HkVFlwI1zjdfodO/7ozcLF6/sKqk71VLKcK5LbQis
         JAPjLFj33UTwcUska8BtPp+wwOU04MTZ57CSrzW5fj/ryc5pJnuHuJCYs4qMX8SLzLzm
         YNqsm7fGyMTa2+IcTUHv7U1oq69C6peqDAX4DqGIRpXXLn+Y0Bl4u1wCYKGXYyD1Mk+Y
         tmsw==
X-Gm-Message-State: AOJu0Yw4HeGPwwLJVIkgf7004qEZnaeR8TSOD11ar0gMJBZEO0s9c98/
	IMs1oqkOSGOEPDdgpPDYGwL2V+hM5d42RfdFD5zc6YHJAAYy/NTxNZ2EnZFflw==
X-Gm-Gg: AfdE7cluoRdB9mZ54VnlkdFxKTa6irgNpdT2ZE5pfxQ6ZGWUO/tT6jncIkPKN1O2aaD
	m5syWgX5Tw59Toe9wuBBffCsyMZ4EEVKZcX/eoACO06MHyzyQW9jiDS9XvzgCddNjKVdTwK3PMp
	ICbUG45MKQslMYe0XiiYiMw7SAu/mhwkZWHvHOR6m0A+pbIgrFsRU+pl8JZKjEt2h5kCLHa3kpY
	ulM29giqhMwRShfzOXn4Ky77KDoOlOSXu6lTpNrddhX32I+k6BXkoSR5gPGfUNM9/SNC1JLj7Kv
	BT8LHsoO9gR7D4Bxzs4BMLSBSwjsc7xkbBplLnbhtP3jXWNbJizTkthoHISEYOaiHFKJ1GXWJRl
	STwcO8V1twbBlTGjlTvMNNFjYwFamxgcLxbhZpuq5F5BEdfcZgc9XKWboaSjpeaMX5M2aaX1LCo
	l86EkdN3xcHiknm+r/cjVWaCsKtWQ66Py0+IDFOikDltl2dA==
X-Received: by 2002:a05:6a00:f89:b0:842:2419:6c0b with SMTP id d2e1a72fcca58-84889637ff9mr9302291b3a.10.1784000198378;
        Mon, 13 Jul 2026 20:36:38 -0700 (PDT)
Received: from smtpclient.apple ([43.224.245.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f242999sm723429b3a.1.2026.07.13.20.36.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jul 2026 20:36:38 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH] sched_ext: Validate cid override before updating tables
From: zhidao su <soolaugust@gmail.com>
In-Reply-To: <20260714025524.04EA31F000E9@smtp.kernel.org>
Date: Tue, 14 Jul 2026 11:36:24 +0800
Cc: sched-ext@lists.linux.dev,
 bpf@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F5759324-507F-435F-A29B-CA8B1CC40FA9@gmail.com>
References: <20260714024704.3318132-1-soolaugust@gmail.com>
 <20260714025524.04EA31F000E9@smtp.kernel.org>
To: sashiko-reviews@lists.linux.dev
X-Mailer: Apple Mail (2.3864.600.51.1.1)

Thanks for the review.
The current in-tree caller passes a BPF .bss array populated by =
userspacebefore SCX_OPS_LOAD, and doesn't modify it afterwards. The =
kfunc is alsoonly callable from the root scheduler's ops.init(), so the =
mapping isexpected to stay stable for the duration of the call.
If we later allow a different input source or concurrent mutation =
duringthe call, we'd need to cache the validated values before updating =
thetables. I don't think that's needed for the current contract,

> 2026=E5=B9=B47=E6=9C=8814=E6=97=A5 10:55=EF=BC=8Csashiko-bot@kernel.org =
=E5=86=99=E9=81=93=EF=BC=9A
>=20
> Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
> - [High] Splitting the `cpu_to_cid` array validation and update into =
two loops introduces a critical double-fetch TOCTOU vulnerability, =
allowing an out-of-bounds kernel memory write.
> --
>=20
> --- Patch [1]: [PATCH] sched_ext: Validate cid override before =
updating tables ---
> commit 3a1a6d6109297fa0a7f1d91d2dccc68df1527d12
> Author: zhidao su (Xiaomi) <soolaugust@gmail.com>
>=20
> sched_ext: Validate cid override before updating tables
>=20
> This patch splits the validation and table updates in =
scx_bpf_cid_override()
> into separate loops. This prevents partial table updates if the =
validation
> fails midway through the user-supplied mapping.
>=20
>> diff --git a/kernel/sched/ext/cid.c b/kernel/sched/ext/cid.c
>> index af83084ec740a..e398e3f209bd4 100644
>> --- a/kernel/sched/ext/cid.c
>> +++ b/kernel/sched/ext/cid.c
>> @@ -329,6 +329,11 @@ __bpf_kfunc void scx_bpf_cid_override(const s32 =
*cpu_to_cid, u32 cpu_to_cid__sz,
>> 			scx_error(sch, "cid %d assigned to multiple =
cpus", c);
>> 			return;
>> 		}
>> +	}
>> +
>> +	for_each_possible_cpu(cpu) {
>> +		s32 c =3D cpu_to_cid[cpu];
>> +
>> 		scx_cpu_to_cid_tbl[cpu] =3D c;
>> 		scx_cid_to_cpu_tbl[c] =3D cpu;
>> 	}
>=20
> [Severity: High]
> Can the contents of cpu_to_cid change concurrently between these two =
loops in
> scx_bpf_cid_override()?
>=20
> If cpu_to_cid points to shared memory, such as a BPF map, could =
another thread
> or BPF program modify cpu_to_cid[cpu] after it passes the validation =
in the
> first loop?
>=20
> If this happens, the second loop would fetch the unvalidated value and =
use it
> as an index for scx_cid_to_cpu_tbl[c], potentially resulting in an
> out-of-bounds write.
>=20
> --=20
> Sashiko AI review =C2=B7 =
https://sashiko.dev/#/patchset/20260714024704.3318132-1-soolaugust@gmail.c=
om?part=3D1

