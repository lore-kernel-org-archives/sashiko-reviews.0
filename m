Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702C6598BE6;
	Tue,  8 Sep 2026 17:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890273; cv=none; b=bXkNbDdpkbuzjJ0dhEf6vOXeJxFwjFSfJrBteNNY4iFLGlOzFuD/bsC5tqlGNOmPJRu4mdRLp9HkKM3V5kNR3KoO/kl+9mby8Spk6PFPYxRqpGq7IEAOkjdBNL8+JF0Rw7Yeliog6y8S+9Z+HwEqdDVdFuVnVf0lg14+9U1yPao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890273; c=relaxed/simple;
	bh=6EPl8PH0ghzR4wjMiR7Q8Me3AMe7QphGpp3x2/jbeFA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hRIRWQgh7p4QrjSBb+9YQLC6p+uqLwEuz1WqcONfHqr7PrqakoggX43+hBFP2P+Y6j01UC+MmPU7oLoImWqIVbaZvVay2SQUH/1elCApZpJGGe/x8NceCrNZBiU8ajm6rI67XjFOszt1NyNsrkoEyCP33hQjMwp8RRwkWn0A6LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0hqGPk4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0hqGPk4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268DD1F00A3F;
	Tue,  8 Sep 2026 17:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788890272;
	bh=//+DL+MTdww4mg3Ada41hfau+W3+4fTfJDlGXqtRQ+g=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=g0hqGPk4zPW9c8Twt5I3lvgfk+Go24yDrMljL5pxSNprflLo02wPgY7O1YAbrpf6z
	 B18S6wTZHkkPnIvFjN8NLm+/GV7lR6LIAMVRixdxDXWSXB7Mb9navlwe1oBtJXnnwY
	 b58VCIchRFziU8y+eejNEZGA/uAObp8U+tBWD2S6oP/stwhGO06GFjunO6v3dXjVRt
	 oorPpzdePeFUgb/LGggTtinN8N0WPbvsOhUVwdAzYd8uOA4przBrBjV3D4uiNdmEo6
	 jxRMfGrOHWhLylpVTt+Gkn6BV467DQ5PWc1ySMT7QEdY+ob129Sfxzi3CeEo0iGktE
	 /zCq852emfUXw==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 7A69E1980052;
	Tue,  8 Sep 2026 13:57:49 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 08 Sep 2026 13:57:49 -0400
X-ME-Sender: <xms:m0yganBEz592w3zaueDtR7ZFMJuduTgR4_oAp4uYnGQcEUKBTWMAEA>
    <xme:m0ygaoWXi1Wg2fis7naZkECFFqQoz7FRuvyCeaUXFH8ugw6V2OvBcWbkkpKO3Jhno
    Qbuxvq4P2EyZ9V6rEGDXYJKQ4uQqujibWDp89GKqxDJM8Rg7xixhkw>
X-ME-Proxy-Cause: dmFkZTEXuYpjZ1wAkm/2LvOlQkLNMJ0Z2ChbMNcUSPWGbBGa6pqiWHAiObHM8tVPEL8QRd
    hiQ0ImqRveN7sdGSqUU0YGgzBllaCjWQB4kYxULxdZNCa4cmDb/MsC6/zrUP5SDhtMDV0p
    jnj69s5Gt1Uv0hwRtF2k9hsoDrdBwK9nYe022ghrXEsBgmh2orTz389+Pz0k4JcL+buYHh
    noVq6d1kLrVTMDtTneTDA3E1ZeFPxU9FnBh+PYnJAu2q2/Ko4ZFW7mvLGpR3ZPAfxZ6yl5
    BW2DGdjjhiZ14+1/Vp6ZUbNGc0DzP1tfRGtofP9SKAKFsSVj9pJkR3bRJTyBMUs/EG1nTW
    9i8lIDtnYNZE5QDCBW46X/1FHPBerBS1bv4MO92XuSICv9LBCIu3kGX5DBNbp53z+Z3hdg
    0ML+hgh0GrnP/W0GdztR81vqWvIQaMVbo1KSQKwFcN5L//4Wa4dziECNd8RqLIVTPqTtWw
    D7tFLz04Ygk+vedTXAFQDh9FMBfoJy7Lo2sg52V5KjJanOrRTM4WVfSlys00K52SG04MSJ
    TT4L2WEamH6Wu9Y3WbcKkfT7KIMP94SgDZzzvEM7uMBkLEyg49Gcth09l17LaOhy1Bd4Cb
    zMO1mC9X0mhlg5An7kidoZ0KbEbBENOiDidiLefnjimZdNHBWsBYorQOthfA
X-ME-Proxy: <xmx:nUygapVBmx82bC4_JiB5d0FBdHsJWIsiwjagP-cYQmf5WyT_ZDFBiQ>
    <xmx:nUygajnoSxLTefYkU66TYj_MqSVieBuN-Ydow3CMkq5HSY9SkAo0Hw>
    <xmx:nUygasCkv6cB9GG8CyiV-elc4gzfXqNW57cL7mKDJMI8qgJa22rBNQ>
    <xmx:nUygaqijVdzWFxCRkkZiv3X-bZeMrE5w6tV1qROsNIR1GdmtybYrAQ>
    <xmx:nUygahzvItMafEAba5NyHMHjxd5oP2hvpgjaNcegyXZm3lTJ6_ov1Qxb>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id DC7BF32A0078; Tue,  8 Sep 2026 13:57:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Aub4sDdj1xcV
Date: Tue, 08 Sep 2026 19:57:27 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, "Frank Li" <Frank.Li@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, "Rob Herring" <robh@kernel.org>
Message-Id: <a859cd07-8f52-4ae1-b28c-7bc052694a5a@app.fastmail.com>
In-Reply-To: <20260908155546.5DB8B1F00A3A@smtp.kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-3-arnd@kernel.org>
 <20260908155546.5DB8B1F00A3A@smtp.kernel.org>
Subject: Re: [PATCH 02/13] ARM: remove footbridge
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Sep 8, 2026, at 17:55, sashiko-bot@kernel.org wrote:
>>  __tagtable(ATAG_MEM, parse_tag_mem32);
>>  
>> -#if defined(CONFIG_ARCH_FOOTBRIDGE) && defined(CONFIG_VGA_CONSOLE)
>> -static int __init parse_tag_videotext(const struct tag *tag)
>> -{
> [ ... ]
>> -__tagtable(ATAG_VIDEOTEXT, parse_tag_videotext);
>> -#endif
>> -
>
> [Severity: Medium]
> Since this patch removes the footbridge architecture, should similar
> arch-specific dead code be removed from arch/arm/kernel/atags_compat.c as
> well?

I have a separate patch to remove that file entirely and chose
not to remove the lines here to avoid a merge conflict.

>> deleted file mode 100644
>> index 96a74d447028d..0000000000000
>> --- a/arch/arm/mach-footbridge/Kconfig
>> +++ /dev/null
>> @@ -1,57 +0,0 @@
> [ ... ]
>> -config ARCH_NETWINDER
>> -	bool "NetWinder"
> [ ... ]
>> -config FOOTBRIDGE
>> -	def_bool y
>
> [Severity: Medium]
> By removing the FOOTBRIDGE and ARCH_NETWINDER configs here, what happens to
> the drivers in other subsystems that still depend on them? 
>
> For example, drivers/watchdog/Kconfig still contains dependencies like:
>     config 21285_WATCHDOG
>         depends on FOOTBRIDGE

See the longer series with the patches to remove this.

> And drivers/char/Kconfig has symbols like DS1620, NWBUTTON, and NWFLASH
> that depend on ARCH_NETWINDER. Will these be left permanently unbuildable
> since their configurations are orphaned?
>
> Additionally, 977_WATCHDOG depends on:
>     (FOOTBRIDGE && ARCH_NETWINDER) || (ARM && COMPILE_TEST)
>
> If someone builds with COMPILE_TEST, won't this driver try to build but
> fail due to missing headers?

I don't see any headers causing problems in 977_WATCHDOG, but
I'll do some more build testing on the current series before
I post the next version.

I did randconfig tests on a slightly older version of the longer
series, but not on intermediate parts, so it's possible that
I missed something there.

>> diff --git a/arch/arm/include/asm/hardware/dec21285.h b/arch/arm/include/asm/hardware/dec21285.h
>> deleted file mode 100644
>> index 894f2a635cbbd..0000000000000
>> --- a/arch/arm/include/asm/hardware/dec21285.h
>> +++ /dev/null
>
> [Severity: Medium]
> Will the removal of this header cause fatal build errors for the orphaned
> drivers mentioned above?
>
> For example, if compilation is attempted (such as with COMPILE_TEST),
> nwflash_init() in drivers/char/nwflash.c and serial21285_init() in 
> drivers/tty/serial/21285.c both still include <asm/hardware/dec21285.h>.
>
> Does this patch need to remove those orphaned drivers as well to prevent
> build breakages?

The nwflash/nwbutton and dc21285_serial drivers have a hard
dependency on ARCH_NETWINDER, so those should be fine.

       Arnd
