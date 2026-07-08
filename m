Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C053F28851F
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 16:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527437; cv=none; b=RsXKS6un57TzuFVEyV5PmHa8Y7O59dtYTOzyUFSUqisoZTznLA7+221elZKWRua6I3hUsHA5YXUhEGeDEFp2HGHc9QSpz2OjUROOWd047XI26zPKW9DnncQBPcDFGsxyg8YRzO/MRkUIZnLYnHLvX3HHiw5/6Y5urtY2zH0x9Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527437; c=relaxed/simple;
	bh=TvD9B+ifvchvpbad263Jrw3KjsKJSdEViWfDLp1Wq1E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=tx40wjTEBE2JDLVfZg4f0qxk0ylROH5Snw08pXN5qWEa8rNvYoTpV9lew82CnWiVJDwtAn7pc6s9Ew+7kDHWH/4tTKa8h4XyXYi3HvgUwH1E0LmzlO9MpZWyQ4rjo+rT47S0DCAVHs1Z0goo/Ong4Su6iesBjxPdBWUATIqj6Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=ThFPvkoO; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="ThFPvkoO"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cad8076b01so10600335ad.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 09:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1783527435; x=1784132235; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HDc4sp0ktVL664dgCwtVdABuvl0X8XvCgcuR+gBWW5Q=;
        b=ThFPvkoO2G1DdmTZ6SvLgf4+/F9K9qpDqixeAAnA8m5JrZJLIPWBUpL2cFi7uRtqRj
         GI7OQX4TAFs3DljRtafJAp/Uwlb2mTRUHYUP2K45wPUXjTuzBjvr9jHzaD7KbFDQM2PY
         hoYI1zKSN7Bo5Fhh8AvJeDbrF0TdZhC6k7K+lb0PeDutW0RMUgVAc8c+JaFzCpK5oULY
         xJ7aB5bPeKtq74iX4CBGAA04t49i2bOTS7eYDfvjppLZqn5iEmGOgEWDtAog61kVPhZq
         6kyGTefK+X3xS1Yd6E6cY9imvcKlPgkGNngqTliSpYHuRyWhTXcWmFAWtAKcyICE0o1w
         wtsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783527435; x=1784132235;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HDc4sp0ktVL664dgCwtVdABuvl0X8XvCgcuR+gBWW5Q=;
        b=O5NT/0c7Vp41AG++wi/BmGT3y7OvvD0Zz7Hx3mIkd96fNXzpD2Eb1yFaN0XLorwCqi
         uyBE3Yx3k0sOtm/maJ3vuFAJXDV7S5PYyWq4ha3UuLHH9r2TCHL9cHd6mE7QT1yOb1Wg
         fcScHviKF/3TuoG+t5B18P9IMZh5iuPLOwOIfnydk2Naf9gX+tp+Vg2ukXaX7cTxFUQZ
         82GvLFni1a3QJ0The+isWoHSiFedVp+mDov7fnQcOxs+MUL0Y/NcfPxFXyA5bKmMb6Ee
         U7d5OpBtTuDi781FNWlYGQ3UxelSp/MvAFX3xqaA/pNkrbdt6sUvQKoDdM2n2sEG+zF1
         Yk6A==
X-Gm-Message-State: AOJu0Yx6IXistVVsCXzXsQJSeKBTzyKZPY5QWDz7tCQcWp8xpZOeZYep
	1qMU0JdCs56sUhyHOlFjrKzZVldyJ1+pYCNPBfPQDfijfvMl0ptPqzzzi7CNRr/u++IwMjvQs68
	X0MtImb0=
X-Gm-Gg: AfdE7cmaY6il7APom10le2/yDCAeneXpZL7ZtFYbxvhjhX3zGJEPcHUAxbIgtuE4Ci8
	IYAEghUOYs2ic1V18nQmtHJCyHceblaMpZnwXorfhER9MTNjRMjnGWWRRBQ38Ddc8kTt6L8CuGf
	oDO7eYncWc51SCFeangXvDzSJ0TItHDvNFHakyoVDGWBFSNNfkTFzfzG6M0DMEtBR5WtCHzdYvf
	Y7To1gxKCwJNHHn4r6UPhYP0ocl5H82sxH9yBrNKJYM8ZMvw+nH2/xlQftaJWHzew/Vj4NCWP2n
	xHtnA1DvhXzCuqUqZJMRzf8nDZxtN89GrbTlgXCwvRBlQrJalAYFkJwYKTc3tPaMgJS9qRACvZG
	a0AICFhqe3RT22gf0KQ5avloQ+Dw/8Yy3Vv1tkAucfc9AJUgoZj4MMhVqxuW5lu/2bBdy3t55Ks
	PaaO6YN+PdpCAHDTgSCmZY9l2ts7MWC0Ylnz/JlpoIGg==
X-Received: by 2002:a17:903:19cf:b0:2c9:fb11:1bf4 with SMTP id d9443c01a7336-2ccea35b0edmr36153145ad.7.1783527434829;
        Wed, 08 Jul 2026 09:17:14 -0700 (PDT)
Received: from localhost (107-190-31-17.cpe.teksavvy.com. [107.190.31.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3da55sm30310595ad.71.2026.07.08.09.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 09:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 12:17:13 -0400
Message-Id: <DJTBPJU8BMID.2CWWRIAJM58OY@etsalapatis.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf v2 1/2] bpf, sockmap: Account for receive queue in
 FIONREAD without a verdict program
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: <sashiko-reviews@lists.linux.dev>, "Mattia Meleleo"
 <mattia.meleleo@coralogix.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260708-fionread-no-verdict-v2-0-29dd293621c7@coralogix.com>
 <20260708-fionread-no-verdict-v2-1-29dd293621c7@coralogix.com>
 <20260708135629.9F84F1F000E9@smtp.kernel.org>
In-Reply-To: <20260708135629.9F84F1F000E9@smtp.kernel.org>

On Wed Jul 8, 2026 at 9:56 AM EDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The function sk_psock_msg_inq() is now dead code and should be re=
moved.
> --
>
> --- Patch [1]: [PATCH bpf v2 1/2] bpf, sockmap: Account for receive queue=
 in FIONREAD without a verdict program ---
> commit c5a219566b06af42fd341fd941447a9a448fa4f0
> Author: Mattia Meleleo <mattia.meleleo@coralogix.com>
>
> bpf, sockmap: Account for receive queue in FIONREAD without a verdict pro=
gram
>
> This commit fixes SIOCINQ reporting for tcp_bpf_ioctl() when no verdict
> program is attached. It accounts for bytes remaining in the sk_receive_qu=
eue
> by adding tcp_inq() to the reported value.
>
>> diff --git a/net/ipv4/tcp_bpf.c b/net/ipv4/tcp_bpf.c
>> index cc0bd73f36b6d..8e905b50deadb 100644
>> --- a/net/ipv4/tcp_bpf.c
>> +++ b/net/ipv4/tcp_bpf.c
>> @@ -344,7 +345,21 @@ static int tcp_bpf_ioctl(struct sock *sk, int cmd, =
int *karg)
>>  		return -EINVAL;
>> =20
>>  	slow =3D lock_sock_fast(sk);
>> -	*karg =3D sk_psock_msg_inq(sk);
>
> [Severity: Low]
> Does replacing this call to sk_psock_msg_inq() leave the function as
> dead code?
>
> Looking at include/linux/skmsg.h, it appears this patch removes the only
> caller of sk_psock_msg_inq() in the tree. Should the function definition=
=20
> be removed alongside this change to clean up the unused code?

This is a nice suggestion, if we can remove the function let's do so.

>
>> +	psock =3D sk_psock_get(sk);
>> +	if (unlikely(!psock)) {
> [ ... ]

