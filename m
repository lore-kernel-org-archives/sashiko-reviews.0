Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BD03CD8D3
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 20:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782334271; cv=none; b=lc7rVeR4I5dg+QUKLCujZkrP1EQu6c64xhYkwfqxsf7RG4kyug0FOwMqxEiQXkSTXn4B8ZZyLT46h0imVvHjV+S3hK51mSvq1AicBPXpPIohFfh3MaEqljVVlouUQ8u/XKmhDUM6T4R4V753i07NpxT/yubA4k07h60gZGp9ntw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782334271; c=relaxed/simple;
	bh=SBzi9dkcN5hU5Wcld3vu8eCHzWFSgshh/sAigoFH608=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=dop0cwRAIxXHtDvhN3c11y4qQcXS3FFlZQgZegoHG8zyFb+CYJEKMPrmCjspyxZXX50ZFkCVgjH82qWJQGYXRhMPMwa5pLx41KYZ3cOsd6Jl+HNwcZ2qekqM/uP+wrDFgqAI5p+xjXJQpLKAECdfypchyFXhNEklVe5oEVVWWmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONMOc7gL; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONMOc7gL"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-44793168d3bso1170020fac.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 13:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782334268; x=1782939068; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WByAAKL6oeilqFf4vAWcc6Tjabs5lo6s/RQ2JISCII=;
        b=ONMOc7gLK7oq0DoYJj+AEXWRs4kPEgXPzIRzLOHuKtu3NU0WClk2MI35AzgL+F1p4+
         JcYaCseLsqSgud1Lil6QTc+uSbmw7iK90Ny1ziHz+AZfN5rTjpibkaMGXL30VQGou9Y8
         Z9sxHwy4Aab7xyCFS5z+XogNTKTEl1ZtzL0gxlUOuUf+jkMha2wf84rJOzhGreGb764j
         rrAAjjsKbps9Qz/tUlEe5vVnhtpQTKbC84/0XzPK3CQB3FV/pI8/YLEn2njJlb+CoeIb
         JC5Lot4+qwyITL9HNJfgBoBLwXcwfRkJ6zU+/Nc6B/FjOgBEnh8jfCc5O4Vdov5Nfwfr
         rafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782334268; x=1782939068;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5WByAAKL6oeilqFf4vAWcc6Tjabs5lo6s/RQ2JISCII=;
        b=Py/FRoiYu98Zv9cuHDLRAsMvBAexeI81j8q2CouAlPGC0QPrRP5f9iTSGImRLdxxlk
         oTTdhYhsAwwBJOWZZX8gcRZ+q2+cZx0s4UEfMvrhAyhCI52oPhickDwc8wW2xZwzCQqA
         Te41WuQWzOHO293K9Hy+cBhxE58/Fu4BSdp/IwGldSMs2qrpmU0UqFUyLLvUgvIE+fL7
         Ch+DqpzKkw7g+3i2lM8Rx2Yle0NOHgs7cnhc7GvS6F0TEkzGOG3JMd6NgxoP8X1aocU+
         avwlIireRizJwKP2+yg23oPKhpn3WOcuX/Gtu8vTI2WxVMjM1H1iROOm3soE9XmCUy35
         QQyQ==
X-Gm-Message-State: AOJu0YyuxdBiKpXy4oHIKNTx9G7OTLFcZ5ANqWzBTXrVBURSxsu6igVx
	c+qlrXjzrsv/ddPMFNiPrGmmAHWrRPjf5Piw18GAD6DUKN3r/4piJcKqfUQEmA==
X-Gm-Gg: AfdE7clk4o42+0GxOgC003cJT8m2gmbxppvxiwZGgrWtFMbJvvYxqiYfa2u92/ZyNiQ
	B+ictH2GsoiTPXJu/0WY3iKD6+b+j6FN35PHK2poHuvepx9kefVStYegivY4YYttOzt/ZVc/1p+
	oglvoHvH3OUDnt8S0D5RRU5GWtXDhtmIiztGqLgf5uydjCKmlTpUCDNx1N0mfyTsTFZWk5HVcJe
	i8QWyafpW3+69fkf/c4mojvQh8X6r/rJLYECuO5rd84Upa7HPRCUMruAwYKs4ovs3Gckg2Gjv8c
	HRq1556DLqxv0C/OAm4ywd9z25xriCLh/H4MUMaJE/KDSoT3z+aXfjJF8s2jAlwmtGZN5ShhcRF
	zKSHiIsQJMIYh5huREFp0aurzYNLUMI3MbM++cgz0BGmcrXGz8O1T6nk0rtQg0fjvX3SdGRVJIo
	e6mi1mOzCMyoTx0znt8nX3UnAuB/pKX7RfHOvEhuxKbrlHI5XUf/42F+0a8rgmiQ4MhXie23L6X
	KIexw==
X-Received: by 2002:a05:6871:553:b0:423:c79:6a2a with SMTP id 586e51a60fabf-447324e1b09mr15338356fac.26.1782334267579;
        Wed, 24 Jun 2026 13:51:07 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:c::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472f0eb8adsm10937459fac.18.2026.06.24.13.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 13:51:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Jun 2026 13:51:05 -0700
Message-Id: <DJHKRM5FGZUU.1UF7CLMVRGYJF@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Mahe Tardy" <mahe.tardy@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v9 1/5] bpf: add bpf_icmp_send kfunc
X-Mailer: aerc
References: <20260624185554.362555-1-mahe.tardy@gmail.com>
 <20260624185554.362555-2-mahe.tardy@gmail.com>
 <20260624191927.BE72B1F000E9@smtp.kernel.org>
In-Reply-To: <20260624191927.BE72B1F000E9@smtp.kernel.org>

On Wed Jun 24, 2026 at 12:19 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Missing `skb_valid_dst()` check for IPv6 allows type confusion w=
ith metadata dst entries, leading to an out-of-bounds read and kernel crash=
.
> --
>
> commit a59a53956c9b8f69a9dfa47bc54cc9fbcd9759ec
> Author: Mahe Tardy <mahe.tardy@gmail.com>
>
> bpf: add bpf_icmp_send kfunc
>
> This commit introduces a new bpf_icmp_send kfunc to allow BPF programs to
> generate ICMP error messages. It clones the original skb and invokes the
> underlying IPv4 or IPv6 ICMP send routines.
>
>> diff --git a/net/core/filter.c b/net/core/filter.c
>> index 2e96b4b847ce1..f3aa494ed1053 100644
>> --- a/net/core/filter.c
>> +++ b/net/core/filter.c
>
> [ ... ]
>
>> +__bpf_kfunc int bpf_icmp_send(struct __sk_buff *skb_ctx, int type, int =
code)
>> +{
>> +	struct sk_buff *skb =3D (struct sk_buff *)skb_ctx;
>> +	struct sk_buff *nskb;
>> +	struct sock *sk;
>
> [ ... ]
>
>> +	switch (skb->protocol) {
>> +#if IS_ENABLED(CONFIG_INET)
>> +	case htons(ETH_P_IP): {
>> +		if (type !=3D ICMP_DEST_UNREACH)
>> +			return -EOPNOTSUPP;
>> +		if (code < 0 || code > NR_ICMP_UNREACH ||
>> +		    code =3D=3D ICMP_FRAG_NEEDED) /* needs a valid next-hop MTU */
>> +			return -EINVAL;
>> +
>> +		/* icmp_send requires a rtable; test-run synthetic skbs lack one. */
>> +		if (!skb_valid_dst(skb))
>> +			return -ENETUNREACH;
>> +
>> +		nskb =3D skb_clone(skb, GFP_ATOMIC);
>
> [ ... ]
>
>> +#if IS_ENABLED(CONFIG_IPV6)
>> +	case htons(ETH_P_IPV6):
>> +		if (type !=3D ICMPV6_DEST_UNREACH)
>> +			return -EOPNOTSUPP;
>> +		if (code < 0 || code > ICMPV6_REJECT_ROUTE)
>> +			return -EINVAL;
>> +
>
> [Severity: High]
> Should there be a check for skb_valid_dst(skb) here before cloning and
> sending the IPv6 ICMP message?
>
> It looks like the IPv4 branch validates the dst to prevent routing table
> lookups on synthetic or metadata-dst packets, but the IPv6 branch does no=
t.
>
> If an IPv6 packet with a metadata_dst (e.g., from LWT or a tunnel) is
> passed to bpf_icmp_send(), could icmpv6_send() process the invalid dst an=
d
> cast it to a struct rt6_info in icmp6_dev()? Dereferencing rt6->rt6i_idev
> might then read out of bounds from the metadata_dst struct and cause a
> kernel crash.

Sounds like a real issue.

Mahe,
when you respin please cc netdev.
We need an ack from networking maintainers.

pw-bot: cr
