Received: from mail-wr2-f1.google.com (mail-wr2-f1.google.com [74.125.225.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5773644C1
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 02:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375894; cv=none; b=JLELkna+vga+f/FIHC/grXFAW4o9x96myq3HcjG0ho1ABIRZvBJdmdZVqgg8mERVMcuhlTv47zonS8zw3+CvtrPnB/x2Ccgz5Wf1qfpvqh7Bgr+Esa1ClBfi+zVKVgjZ0L43B21wMPoLWhrxtMCzxAMSJH4zRjroKFtb7PTOe9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375894; c=relaxed/simple;
	bh=//y/MIu9uR/LXkr1muCyOtxg09cxnF6FAzBp8EMUteQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WYJaokZa2+F9CxOA1iqaLbcC+LpOF0WT33j/WtQywFw7p7ZeW8STnsH6BWh927dakBBSF0z3UjjPPxICWgSMwwlecka89TTqoLIvCbHSVHAX5EaslPanVrupkcdcpoX1DSGmWYT+GhVl80usnaJjG6syDhyS8m7VuIvtKv5Ee5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+KfpUZx; arc=none smtp.client-ip=74.125.225.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+KfpUZx"
Received: by mail-wr2-f1.google.com with SMTP id ffacd0b85a97d-48df388215cso764927f8f.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 18 Oct 2026 19:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792375890; x=1792980690; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yq8r18auL3kyxH5XJ1eYj6G//xk8iEfWZvNxcHJYvp8=;
        b=g+KfpUZxS76195E+ToZBsI0A7BQWuxg2mzO6hBTa59Z8FYhH9oyfaLZajHsZ8EbsIj
         uETLyWF6CARZs7yON33WeZRl9YEUSCeXn7QmphBSem59qrxa1iyUXGE1Xd+jbwwOv5nd
         wMKHd7taLT1rIfpaj5ZtqkWSaEH+eOtNyyAMAt4ZWRZjOUhvWWCu7EiH8F8WgqreeAL4
         LXMsagV6KhvRv2MmCZ695ihpe3+AsNbUFsRUETrmv+sx/HEh4dRJuE69aygS33J1KLrU
         yahdSRdX/V+MDgy17rNPT0S4PTjfWAz9gsZ8dV4jOPdMXpbqMAq7QsUdE6ymX7ap7D30
         igUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375890; x=1792980690;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yq8r18auL3kyxH5XJ1eYj6G//xk8iEfWZvNxcHJYvp8=;
        b=oZuXwQvPUWODKX1YuIL+X1nTalWb79Xl69SAQM7+vrXZAWVvqK6gU4KIvSG2i/qhU7
         Z+xnQ01F7W94P5TCRqVy88q7kdzKRxEuVliDq+4mGvabE/aCl3T8ucrBFK5VVO6brWoU
         whUQv8uksXdN0styCAVaiItGcHsR8OllKkM/S6az+urHwLDGPPUQyVAu/0KDAFEADOdJ
         GN7j5trBJphtCOsxVSqvnnAH2jFT6uPgu9MdyppQrYthHVG4SgpY0cMHBGAbo75uH2GQ
         d9SE5zhyLQs5BWtWWYjaiaV4MKKq/soQjPpK8pjW33QPwaC3kbam3Ckr0ibQc3D62zRu
         92kQ==
X-Gm-Message-State: AFq9FYKcADtnXFBD8v/QiFt4KIQAS7r7wdYaz6/II0DrzNHnpmmTCYvh
	h03QG3AdHSuzcVqWjHKjJnaeGEeyymEQWwz8Il7JZa9vTxTTXuorbzf75wT0p0Co
X-Gm-Gg: AYBFou3FrulVYfffJsSjhbg2DqK6kgWDWVH1PIHz2RRgJLjZWZwRq2ETSgqsAEcu9M2
	a25MuHtLjCD3iEvfB16h1Nbxj8ueb6RtnRCltKgiew60ODdGEY6Uit7JPD/ma0a7gonfTt1rPIg
	HbM1UIHZftK5Q9TkKQobDt2SGe2pfWP/KZaoyyjrRrP7jwDsP/xP62omJxqkT36AlryIev/BgNS
	otQ/HiUVTcfw++0T3dLuwVQVVWjVhcO+Vmw9QHYFB3b1gU3SEgi6BuwXtqa6GGAp0nCSaNnyqDG
	HqygAH/8ZqG2SlYuB+qdlN6L6w47M+Ehzhi+MZ39Eg+K4q4hM1pC8AFhMMcfpgo8kfTjfPANoCX
	OEGqIwZ80O7lXNfRRZ7vlvdvcfm89JUWWz+YwkUS2iQXMIHI89C/EUakNKj8YH/g+sB+cL9xFdI
	JxAfsCEz3Bt6gyQyUafY9ZSmrQ3WM2xL6+21luNyEuuDI0MPNlcjpl/+9HbZT+1r1p+YRjbeowj
	WkZN0c2jMdfnJfrGeOMmXuFknTf0PxgaAEop3W/GcBNwfz1lkLBWSwIwCb53+WV9dsJq//FfpLT
	naYdveGX2zMkH7iClZ9up28PzvDFjX7Ld3AC+gtFhXM62oaT
X-Received: by 2002:a05:6000:1050:b0:48d:ecba:3cf8 with SMTP id ffacd0b85a97d-48e07fa82f3mr8841415f8f.43.1792375890233;
        Sun, 18 Oct 2026 19:11:30 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5b2dsm21520294f8f.31.2026.10.18.19.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 19:11:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 04:11:29 +0200
Message-Id: <DM8G84CGPV1M.24HT5CS3KKB9F@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v4 1/2] bpf: Enforce trusted BTF ID argument
 provenance
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Yiyang Chen"
 <chenyy23@mails.tsinghua.edu.cn>
X-Mailer: aerc 0.21.0
References: <20261007-a3-arg-trusted-v4-v4-0-253ef3a1a69a@mails.tsinghua.edu.cn> <20261007-a3-arg-trusted-v4-v4-1-253ef3a1a69a@mails.tsinghua.edu.cn> <sashiko-outbox-163202@kernel.org>
In-Reply-To: <sashiko-outbox-163202@kernel.org>

On Wed Oct 7, 2026 at 6:43 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] bpf: check_func_arg() allows PTR_UNTRUSTED | MEM_RCU into KF_RCU=
 kfuncs
> --
>
> commit 1e71cf476e59d8805f3765efcab69f9c9d9bba4a
> Author: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
>
> bpf: Enforce trusted BTF ID argument provenance
>
> This commit modifies the verifier to make the provenance check contract-d=
riven
> by marking generated BTF ID kfunc argument types with PTR_TRUSTED and exp=
licitly
> adding MEM_RCU only for KF_RCU kfuncs. It uses the normalized type for mo=
difier
> checks while reference lookup uses the original register.
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index 353bde9ae2274..a0ab793f041d8 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
> [ ... ]
>> @@ -9605,8 +9614,10 @@ static int check_func_arg(struct bpf_verifier_env=
 *env, u32 arg, u32 slot, u32 p
>>  			}
>>  		}
>>
>> -		if (is_kfunc(meta) && (!is_trusted_reg(env, reg) ||
>> -				       bpf_type_has_unsafe_modifiers(reg->type))) {
>> +		reg_type =3D reg->type & ~(arg_type & PTR_MAYBE_NULL);
>> +		if ((arg_type & PTR_TRUSTED) &&
>> +		    (!is_trusted_reg_type(env, reg, reg_type) ||
>> +		     bpf_type_has_unsafe_modifiers(reg_type))) {
>>  			if (!(arg_type & MEM_RCU)) {
> [ ... ]
>>  				return -EINVAL;
>>  			}
>>  			if (!is_rcu_reg(reg)) {
> [ ... ]
>>  				return -EINVAL;
>>  			}
>>  		}
>
> [Severity: High]
> Does this allow a register with both MEM_RCU and PTR_UNTRUSTED modifiers =
to be
> passed into KF_RCU kfuncs?
>
> If a BPF program loads a pointer that is marked as PTR_UNTRUSTED | MEM_RC=
U (for
> example, when loading an __rcu pointer embedded in a union) inside an RCU
> critical section, and passes it to a KF_RCU kfunc:
>
> 1. The arg_type has MEM_RCU, so the first inner check !(arg_type & MEM_RC=
U) is
>    false.
> 2. The register has MEM_RCU, so the second inner check !is_rcu_reg(reg) i=
s
>    false.
> 3. The validation falls through and succeeds, even though the register ha=
s the
>    PTR_UNTRUSTED modifier.
>
> Since check_reg_type() bypasses the strict compatible_reg_types check for=
 kfunc
> BTF_ID arguments, this appears to leave the verifier without any checks t=
hat
> would reject the untrusted modifier here. Can this result in untrusted ga=
rbage
> pointers being used as valid RCU pointers?

Yiyang, could you please follow up with a fix for this corner case as well?
Thanks a lot for the existing fix.
