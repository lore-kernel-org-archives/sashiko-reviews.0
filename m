Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77491478874
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 13:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.163
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034496; cv=pass; b=X5l1j8y4m7Ow49PMyrY7JoXxFtfmzjVfamdXoRFGFu6CpM/2KqmU7jdC3GYdhERwfcynoD4DyiO3coH+9UPPnlNKr3fencVLRPf+fBFCmK/MquZKPf+xi1iRdvxOFkQ5G3sjIz17mJna9NhPl5tKDr2dwgxXfk+C/in86iMgthg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034496; c=relaxed/simple;
	bh=znxXo87iY2K7i0i45/hzGRAFQP5Qw+DyoZxvELMx7Og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=teoaZHxkE2EgnHKyBSSB4Pm22wHeAS5ICmy+NJz7ZUQx8mxixQMyQm7QH2nRWBEG8q6+dmHbXniUZUUHYV+qKWXSuFyFDr1MojXOuY7oftGT3mippg5UqlE5wDNZb3eMcaaxUc2Rnp4FNolRgcFzBn/Fg62vvy4yH/MzIe+bN3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hartkopp.net; spf=fail smtp.mailfrom=hartkopp.net; dkim=pass (2048-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b=eTpvkjxb; dkim=permerror (0-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b=RHrkez8z; arc=pass smtp.client-ip=81.169.146.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hartkopp.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hartkopp.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b="eTpvkjxb";
	dkim=permerror (0-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b="RHrkez8z"
ARC-Seal: i=1; a=rsa-sha256; t=1784034469; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=mvCzuuFFHWuDsV3S9xC5/QKO2CaLh7IpLYVJ7RUBx6uwf6BNZ2wRsezduDQiCklaOT
    Ae2MLitDufTTaEyIeqeSJ0BrptoyjhJ0876WbSOaeQPfIFvcKqVXcMiQ3TZOqxFrQm9Y
    4ateklIU4uDAmThlp5vgICrPcg4ifIHULHoeP7/GXCqF8PlenDXj3klk/aHGV7+4gUnd
    TsFNompTCwuTjlYf8mpz61x4f+Rt0HIDi9TsciZHSdolawleS8xekHy5jXM4IV8ZHm4z
    yLl3pB1MvIOf59JphmCTprhRySaJfJkKoVbCt5FVBkaKVtuSEY6oNM1k+IuWl+pK5Yu3
    rRIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1784034469;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=guEuGcTlCYA/IKVUqHOhnf18L9VLtdbzdYlIh6ZIP+M=;
    b=tacYFdwe2n9fiueao38evEcvR8BXY+S1FsfpOtizif0wa2hBmxc6IQf2KgBNFldRE/
    9I9E04HxsCcsFk7bOwIuzTLt8XwWxgKz4QD54uxDidhCEcUIBc6O7H5Hbid9kZeM1ToU
    PPCHXS0YVbNgwGPCdimssAkQ0wBOZhX7gC5yAkHjQRIynDRbNFE2hqINab2J6oTfmcou
    PtTAyey8NFWvc1VTiYrB7dsdUgl6kD2C+nvuCWsgcrlVWNm7tbDjsvOmpLvwcCIpKlsa
    atzvIkoRP8JxmaJNYuxkinzzVdc1TEis3C4B4r4l5KrTJXaw0uEqHYyIloVVTu++nU2V
    mnlg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1784034469;
    s=strato-dkim-0002; d=hartkopp.net;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=guEuGcTlCYA/IKVUqHOhnf18L9VLtdbzdYlIh6ZIP+M=;
    b=eTpvkjxbWQUUq686Csxj7Ds70+kern3/XAU5yoUfW9McvqF9L1+NRa31MFPDEJ32E7
    xuxgTjwNcfOfHxxm9Uts43fPfd2sAuQXusbPsO5TemlyRV70Yz5X/emIv/BGuNKHauw4
    Q1trR+biGguScB/1IaGghJVHHhq+8p6RVHbkqkLBF2InHKiDxrg1UJs/o094vWbKuGln
    2cZVD5zqo9vUwSIbw1Sqe1FyVkzfVAblsyI2Loq0VI4ymQIF/7o0/O+z0Jo0wMaR3/eB
    Q6Q4K6r7Yz5G5Agj/dxRe9O0aDQ6gYrJQG7Lh14JQ+8dMpu+2FAigAYl2HTHXZBO8w+7
    QI2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1784034469;
    s=strato-dkim-0003; d=hartkopp.net;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=guEuGcTlCYA/IKVUqHOhnf18L9VLtdbzdYlIh6ZIP+M=;
    b=RHrkez8z3lCG4UCchphNTc3QgzvpozmJ66nIZwKyavn97n7YqHpYFLx3uxTahTNwje
    RX7BI5d762GtbShqnJBQ==
X-RZG-AUTH: ":P2MHfkW8eP4Mre39l357AZT/I7AY/7nT2yrDxb8mjH4JKvMdQv2tRkI16oOSW1Ti/f4PoH8="
Received: from [192.168.20.190]
    by smtp.strato.de (RZmta 55.5.6 DYNA|AUTH)
    with ESMTPSA id Ka9fdb26ED7nkpe
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 14 Jul 2026 15:07:49 +0200 (CEST)
Message-ID: <ee59dccc-0532-4b00-8783-9763e04c327e@hartkopp.net>
Date: Tue, 14 Jul 2026 15:07:48 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 09/11] can: bcm: fix stale rx/tx ops after device
 removal
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: sashiko-reviews@lists.linux.dev, Oleksij Rempel
 <o.rempel@pengutronix.de>, linux-can@vger.kernel.org,
 Vincent Mailhol <mailhol@kernel.org>
References: <20260714-bcm_fixes-v13-0-fd667c61099a@hartkopp.net>
 <20260714-bcm_fixes-v13-9-fd667c61099a@hartkopp.net>
 <20260714104431.65C751F000E9@smtp.kernel.org>
 <2c2bc659-fd26-4c48-a5f4-e9e6a3c43003@hartkopp.net>
 <20260714-towering-phenomenal-nyala-ad406f-mkl@pengutronix.de>
 <1a521f25-0aee-4eae-a0da-3eb7f0702e84@hartkopp.net>
 <20260714-vehement-native-jaguar-4f52dd-mkl@pengutronix.de>
Content-Language: en-US
From: Oliver Hartkopp <socketcan@hartkopp.net>
In-Reply-To: <20260714-vehement-native-jaguar-4f52dd-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14.07.26 14:36, Marc Kleine-Budde wrote:
> On 14.07.2026 13:47:35, Oliver Hartkopp wrote:
>>>>> Pre-existing issues:
>>>>> - [High] Unprotected concurrent access to op->rx_stamp and op->rx_ifindex in bcm_rx_handler causes data races and torn 64-bit reads on 32-bit architectures.
>>>>
>>>> Fixed in patch 10
>>>
>>> Pre-existing issues are not a shot stopper, _new_ issues for a patch
>>> series are...usually are.
>>>
>>> Hopefully upstream will accept that you fix issues in a later patch that
>>> sashiko claim to be introduced by a patch in the series.
> 
> Sorry, let me clarify: This was a general statement.
> 
> I don't want to imply that _this_ patch introduces a new issue.
> 
> If you remove sashiko from this sentence it was valid before the LLM
> review bots. Rule of thumb: You should not introduce "bad" code and fix
> it later in a series. - As this is a huge amount of fixes that requires
> a lot of code changes, I hope upstream doesn't insist.

When there was a new issue pointed out by sashiko I fixed it inside the 
patch with --amend when it belonged to the topic of the patch.

So I tried to follow the one problem, one patch pattern. And every patch 
makes things better and introduces no new regressions (which sashiko-bot 
would have detected) - while probably not fixing everything at once.

Best regards,
Oliver

> 
>> Is it?
>>
>> Patch 10 Fixes: ffd980f976e7 ("[CAN]: Add broadcast manager (bcm) protocol")
>>
>> not anything in patch 9.
> 
> regards,
> Marc
> 

