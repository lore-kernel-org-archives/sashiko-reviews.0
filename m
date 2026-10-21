Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792618920;
	b=BVcjUMFlaMVY9/k5fDjyN6QtWFhkEH29xGK0Df/+QbP+/A9nV+Cn+gHqIkdnPB/XmdcK
	 fWH4EYHsDdCn0vxjSV7qBrDl41k8wr3K1pnPr7wLFhw87agNHC6FkT9VhKAsbiBnODuXk
	 W9gibcY9qi0yzjyQpbntrz6H5m6h59T3P0zi7SKJOO65PmCSDdTUBuYi5UlzRfWGzODW5
	 REkj54uD9glb/PzfcsQzJYlOQtAtA7nDk5Kz+TfhhKOCNBGqHjcXttMKNTsDrl6w7TYdB
	 JyLTHe98Rpd18lFAbQo8+ElxM63fpNHMSmZ7UFVaix0a4NZtZDtluAHR0pvfkWwEtfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792618920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=cdf3QpdJWB/0HDVyOxy8t0UFwHwVO9ns70PxKiQyY/U=;
	b=nxcQ/ScG5nOvfQQH6JPeoJSc8qQxCorOSx2uyqMKjIm6kRPvB9NAeLzC3PLKww5LIijz
	 Lf7T2t5e64Q+XRKkRtJNk5gtPRZB2LFPCNfQXNp1CzHyVWpPzmK/J7qspI5rE7BD3h2KG
	 jn3PEHuEMyfmN+VLkDOqij1COROnf7DRldFlVIgQ8Z8KDnPUI9a0A9Vb/K1CbS9lPGr/F
	 ZyAv7omL796l8AxiDBIXAI1mzRY20vDdiDuK94GJ+KNLeOPJ3yd174MALuXS4lHkviWc0
	 f3VmmuNbv86pN6b5xo5vA0oA/q7HnVDxxoCEPPs3K95yhx41ORGqGDNyfDpCjsjC0OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eVIOEd8a;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D34606A327
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 21:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07D34606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eVIOEd8a
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-368581df789so348703eec.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 14:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792618919; x=1793223719; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cdf3QpdJWB/0HDVyOxy8t0UFwHwVO9ns70PxKiQyY/U=;
        b=eVIOEd8aYiO6PBDmvE2e3MK06Fym5YTNFgYuMt0HOktCNkgvm39F2CabV1gQPynyFt
         99iHtdtXhvVaMUxFd2OI5pGcM9HjW0Q5AultMHzOTahAGJaENk374i+ZMuLeTC0QcY8V
         Jr1ZX1cs5amOAxBC96AqdvceusZuWytb85+eYnS0ZB1GLxKOmNx0TwdDFEkLjreQEsNj
         CjM4QmEzUVE7MFPM7FFDfcAmO4ex6UpJ3hNTT6UA2cIuatlKdvYIoNxwEiZtc0QcT0+o
         yZxrs1T5+DNrdDcAfzP/knB4zb8eRb7OMtzXYcLDimKCYPNOVVy+IaslAE+DBQDTAtay
         TXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792618919; x=1793223719;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cdf3QpdJWB/0HDVyOxy8t0UFwHwVO9ns70PxKiQyY/U=;
        b=NU5J2W7Y9W4pXkIA6aClipMggb2xhZpwtkGzMqh2srENe1BhPFASRkPNjGsQXg6gyE
         4pJoNrPHiOnXxS4+OLyMxTh1oY5fkjgcLfLIJRUpB3GIGNIC+7Zlpn9QIxys1mPoPSZV
         +ixTyvnfA0nmPmPg8n9o1B3/2cauhIwTXUMK8x7bC2Pp8ox5F/0Lo5LEbrHmkj+W8gwK
         yUBjEQIyrmWU++PziJSzYj1/r4YIcm9JoJqwHVIW7sBEK7Daj7RSO01jy7UcU/E3qiA3
         ACzGfg5cklED2NPKd7kg8mCw/kD6AtTWhnIjjfMfb4uTILmQRmkM+ZXbg7a0Oa3j+ldy
         X5jw==
X-Forwarded-Encrypted: i=1; AKwUvByufTpm0HBZugXev2SuHIWif9UwDrKZeJt4GlevmD5O082e96jRSlQ+ozxqg7RWPz9nfCoaNVU94j7FRi+1JnA=@lists.linux.dev
X-Gm-Message-State: AFq9FYLf6gMnnQJqRC09osit7zwVrAM6fyTvFoDN1v2sic0jDqlpekRF
	PKl1Jv759qUIzdq3tnTjEHY0vT6PmU1V4djeNWX7eEBzJyVKP4rEYg6Q
X-Gm-Gg: AYBFou3gV9BPEPX86QDFDH7pd+V09UCPAQbPDdoOLQfKe2a+QiVTbyuLDfM6SEonuAq
	EsZzYWqGglZvbSOXs7L26cqdHUaRByq7LAC4Ov7XOqr/NteXMkjLZGsXdf6XcLW5ekFpwv6qkzp
	OjBZUDb+gjUES2ERhSPE0Lb26fhdkt9wLOwD/DsZ91yOZ/6kA5gsDm4TittpiPYOqbmsQf1/VAk
	O/MipXQyGJW8oJx+l2MvpCtImvzf9wj3dgfdkylhyj0uKupvcVDqHdZm/mXB6680Q8uknCRXkfY
	PZfbc6AtoWEJvMuT4Im3cpxkDeDwLBl6uqsVOjGBmrUhmY1qJOAQa8lNGGNBCL6muWFBBF9A1Pt
	n6ey9WoGEL1tlbFooHKekZACD86aOVX2JedfyMoBuCZ8HKOHJ0XkKS9weTLKjPMPTrQf92HyCd7
	Evqd2UaPd+AzAGPyGRB5KbAOxt14bXrhv1hCHl5j/FOW5g7ZGSN9pXZFzI20Fnum7Ccw9Pj2YeY
	fK4rZiBAiNH2J8+JkkOI574suNn4xAdyZkXFLrUS25YE+nEUw1NWON9DOYFCy78fORFEYuQXF5p
	A5hy2eRPfkVccCyWIGumjJbsGfvYlMqx
X-Received: by 2002:a05:7301:7e17:b0:366:6c79:212b with SMTP id 5a478bee46e88-368b122ff22mr622562eec.25.1792618918940;
        Wed, 21 Oct 2026 14:41:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8439sm10773723eec.11.2026.10.21.14.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 14:41:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <599f18f1-7ef5-475f-9ea2-9a2059299751@roeck-us.net>
Date: Wed, 21 Oct 2026 14:41:55 -0700
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>,
 Guenter Roeck <linux@roeck-us.net>, sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, Guenter Roeck <groeck7@gmail.com>
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v2-3-3396c3a08251@nexthop.ai>
 <sashiko-outbox-178650@kernel.org>
 <dd1781b2-4637-4997-bdfd-d71fc35837b0@roeck-us.net>
 <DM9W9SZZV7OK.33TH12KSMSBQS@nexthop.ai>
 <DMASAV68R9CA.GRPDV6UG4MEU@nexthop.ai>
Content-Language: en-US
From: Guenter Roeck <guenter@roeck-us.net>
In-Reply-To: <DMASAV68R9CA.GRPDV6UG4MEU@nexthop.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/26 13:04, Abdurrahman Hussain wrote:
> On Tue Oct 20, 2026 at 11:58 AM PDT, Abdurrahman Hussain wrote:
>> On Tue Oct 20, 2026 at 8:37 AM PDT, Guenter Roeck wrote:
>>> On 10/20/26 01:55, sashiko-bot@kernel.org wrote:
>>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>>> - [High] hwmon: (pmbus_core) divide-by-zero after pmbus_regulator_set_voltage()
>>>> - [Medium] hwmon: (pmbus_core) broken relative VOUT margin handling in regulator ops
>>>> --
>>> Good that I did not just apply this patch. Do you have time to look into
>>> those issues and fix them ?
>>>
>> Looking into it,
>>
>> Thanks,
>> Abdurrahman
> Addressed all sashiko comments in v4.
>
Yes, series looks good. I'll have to wait for the commit window to close before applying it.

Thanks,

Guenter


