Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274660;
	b=3qYDNZF7aFx6FkXlm8hxuNy9IEaUHiDK8nnQ4jgj7AzqLKIaXFwk9yoKuvHRad9pYMj1
	 tbwlZOsIhuI2CyCOWKfnK/ResTaVi60fErP10lmOqhtazn5Hn0RguBAxu+ROHnNYaFU05
	 Yn+861k4NGlxM8Wv/6h80ufU7D/PcR5wVNzFXn2tvzf/S8QduVH+JkJwLPuSv6WVhuA+c
	 R/B8wQfCHFJTW4ZNnLJGVc6sT5QBBg+8x20gAEYvpHQwDVLDlBVCCJRFp072L82XOb6Os
	 /ggt4HZxiLkFqekrspy/W6eafDaItvgCpbMO2gL3Zpqs0gya937wG2cKKr7/9WkzB2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=3ifG6N3GjuE9TBQMDJaU7DFuzuDNphSyfQc7VRPrMxs=;
	b=Qsbm+2xjFMND2KOgAF1RgGuR/GnY77cyWEfAV0Qxo2cM8CWMLkDMBMbgN1HR35oPBJiS
	 pm9qabN4QZKUGQbzlBWIgIVIvVLWwR7NHrPbmfc8yw3lJGQR0raFor/jjdnZ8GOxGnwzH
	 7+Xs0YyhH57yRjZQQoygA7pLGVkVQDLQ1BMVmtHivm3XSuRdn67zddVAO7D0x5nRLc3T/
	 YFVqQUwew1sK/kFRmq+0LAgQQJbRLytZoLxNDZP4lJb1QmfL2liVHAb7hc3t52VlffWal
	 UFQNjrZKAL1RRsYLsPdexdOWvGacytj3S8OQr4Bm1O5DGtEZMe4GIvHrh8/szeNEqPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="D8Fn/iRP";
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E8D606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 01:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49E8D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D8Fn/iRP
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso619404a12.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 17:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274659; x=1794879459; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ifG6N3GjuE9TBQMDJaU7DFuzuDNphSyfQc7VRPrMxs=;
        b=D8Fn/iRPpFY0WIvqkOhDb6shEFktyjM9/eOkwfH4CrB3WLaTbjVzrsrAocZOn8gD+8
         8JUUBPyXCCeRTdTkv1mk+BlYPyIkgFDDWBDAmnqV7jaGKlSqpLcjU25i+N/Fk683eDvs
         QRso8CgVAyGU01QCFhBLr9G7ZbaQaN8vhbVxH1QVWS/1ZMHibO2zaS0KAuoRJWm93iM3
         X2/9HSDDwgKM7aI22k1CZtKs8A2DLfkxdjeov3glx7ixVkSa5KSctCPJSt1xVF8i5B/0
         zBTZXTrXE1GVUryMI0XgO6YTiGBuXfQ5KX0sDH2Ncv7WmluyBbVODnVum4hd3/7ZOM7g
         mnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274659; x=1794879459;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ifG6N3GjuE9TBQMDJaU7DFuzuDNphSyfQc7VRPrMxs=;
        b=LfnVJ3FpAR+uQmwIU+qOeyekdqOSJuN3xAmHLrd6qmJoJVW57brDnZNEat92rGSLyB
         MHpcUT31jBtc2L42ZjliU5C5FBKAF2YA2hxIUVFSKkufK+vONmJoRqry+46NsPjEXIZb
         k40wmJs1nKzxMvQmsaK1LDKxFzL33vA/TCkZyS7bfs8sZvqoYlj2EOjzzvKzGNYNSpjc
         GCR/lqoPxsHlsisRHWoDK71mhZeucmGfV5AjOQJ8I+oznIP3+iHnNL4dItEqHKtZ7CSQ
         EkPp10jA6QwMIrINOvHD/e460kL3/slacmkLAPDLDCWJnaCAPJx2IZGFxnha2DkOSSsK
         kDiQ==
X-Gm-Message-State: APuU4Z+GFqnldpoJ+OVqv757MHHGfiNILe6EpcOQl0FD7yHd55BrxXHC
	OR6RnXZcAX1AykLLDGmTyBv6oyLLtOhsusl+k0vEfg6GfHx8Hiq6b5C47EOadw==
X-Gm-Gg: AYBFou2KiK6L+rAkaT6s9sX/4n7WtnhhORRuvgo6em8YM/SHAeaZvskyKD8OcHHezNQ
	xCWcVhmc0Lbcl6wyZ0z4oLnQzMtjbiH9s86JrpidlwX7oDV5RS2g7hXDqVcYns/n7ls0lxneQcC
	NQtmholwl7byviJIvBY9T3vS9cKO785A9+9Rk7Mzt86LNfnSTplHUMvKp1dDkKmKtjNllWxvzxs
	UBSx6bAtCNAh0Il8u7ib7fMOtUJa8ek2FqXtYitz+so78s4q/nktI5BgzVEmbtK7ssWtIbKXI8b
	4yLCpeVv4xglc1lH2L10a3OtOQxCsudGqzj27V3XpGg/X3O8KVT5wKX6YllWdiBE7FwSAlprnVc
	kpCUJhMwFROMSAmTOIPjITntBVeCo1jmkTcGZjbHbCwcyqzpzhnQ0ymJKhR1dMSPMtzdlFBdkQ+
	16gBNiY1B2Q3y6AdtPoDPhb0eNYn0O/ZgNhW14l8an+Joxj2M3jNFv7m523jtSQRriEaMAEN7Lv
	Ury9s1CR2oz+DfooXLOj++SUkThBdAgL3Ftsm86RKPRkHXArSV1X1Hvby5S3IItjlWRUS8wRn/8
	LP44MgutPGrioUdhhXap+RiPEVx8INEitjO/mwUySAxlnOdq5tvtrzUCDI8Ep2OEU0qWIJTOjxK
	TxVPMreiKMw==
X-Received: by 2002:a17:90b:2e49:b0:3ae:8106:6074 with SMTP id 98e67ed59e1d1-3b166c92193mr1307280a91.16.1794274659234;
        Mon, 09 Nov 2026 17:37:39 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16792aabfsm1657287a91.12.2026.11.09.17.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:37:38 -0800 (PST)
Message-ID: <81e91f05-f172-4bbf-b5a6-76f2767ea82b@gmail.com>
Date: Tue, 10 Nov 2026 09:37:35 +0800
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
Subject: Re: [PATCH v8 4/4] phy: nuvoton: phy-ma35d1-usb2: extend to dual-port
 with OTG support
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
 neil.armstrong@linaro.org, olteanv@gmail.com
References: <20261109065606.62641-1-a0987203069@gmail.com>
 <20261109065606.62641-5-a0987203069@gmail.com>
 <sashiko-outbox-204535@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <sashiko-outbox-204535@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/9/2026 3:14 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] phy: nuvoton: missing MFD_SYSCON select and unchecked
>    regmap_read()
> --
>
> commit ce87e45e509dca5386021bb0dd4e3bb91e3935d8
> Author: Joey Lu <a0987203069@gmail.com>
>
> phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support
>
> This commit extends the Nuvoton MA35D1 USB 2.0 PHY driver to support both
> PHY0 and PHY1, updates clock-stability polling in phy_init(), registers a
> read-only USB role switch for PHY0, and adds resistor calibration and
> over-current polarity device-tree properties.
>
>> diff --git a/drivers/phy/nuvoton/Kconfig b/drivers/phy/nuvoton/Kconfig
>> index d02cae2db315a..1f37e860de507 100644
>> --- a/drivers/phy/nuvoton/Kconfig
>> +++ b/drivers/phy/nuvoton/Kconfig
>> @@ -6,6 +6,7 @@ config PHY_MA35_USB
>>   	tristate "Nuvoton MA35 USB2.0 PHY driver"
>>   	depends on ARCH_MA35 || COMPILE_TEST
>>   	depends on OF
>> +	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
>>   	select GENERIC_PHY
>>   	help
>>   	  Enable this to support the USB2.0 PHY on the Nuvoton MA35
>> diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
>> index 0b9976fb15c17..bc706356c4341 100644
>> --- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
>> +++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
> [ ... ]
>
>> +static int ma35_usb_phy_init(struct phy *phy)
>> +{
>> +	struct ma35_phy_port *port = phy_get_drvdata(phy);
>> +	struct ma35_usb_phy *p = container_of(port - port->idx,
>> +					      struct ma35_usb_phy, port[0]);
>> +	unsigned int n = port->idx;
>>   	unsigned int val;
>>   	int ret;
>>   
>> -	ret = clk_prepare_enable(p_phy->clk);
>> -	if (ret < 0) {
>> -		dev_err(p_phy->dev, "Failed to enable PHY clock: %d\n", ret);
>> -		return ret;
>> -	}
>> +	ret = clk_prepare_enable(p->clk);
>> +	if (ret)
>> +		return dev_err_probe(p->dev, ret, "failed to enable clock\n");
>>   
>> -	regmap_read(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, &val);
>> -	if (val & PHY0SUSPEND) {
>> -		/*
>> -		 * USB PHY0 is in operation mode already
>> -		 * make sure USB PHY 60 MHz UTMI Interface Clock ready
>> -		 */
>> -		ret = regmap_read_poll_timeout(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, val,
>> -						val & PHY0DEVCKSTB, 10, 1000);
>> -		if (ret == 0)
>> -			return 0;
>> -	}
>> +	regmap_read(p->sysreg, MA35_SYS_USBPMISCR, &val);
>>   
>> -	/*
>> -	 * reset USB PHY0.
>> -	 * wait until USB PHY0 60 MHz UTMI Interface Clock ready
>> -	 */
>> -	regmap_update_bits(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, 0x7, (PHY0POR | PHY0SUSPEND));
>> +	if ((val & USBPMISCR_PHY_SUSPEND(n)) &&
>> +	    !ma35_usb_phy_wait_ready(p, n, &val))
>> +		goto out;
> [ ... ]
>
>> +static enum usb_role ma35_role_sw_get(struct usb_role_switch *sw)
>> +{
>> +	struct ma35_usb_phy *p = usb_role_switch_get_drvdata(sw);
>> +	u32 val;
>> +
>> +	regmap_read(p->sysreg, MA35_SYS_PWRONOTP, &val);
>> +
>> +	return (val & PWRONOTP_USBP0ID) ? USB_ROLE_HOST : USB_ROLE_DEVICE;
>> +}
> [Severity: Medium]
> Can val be used uninitialized in ma35_usb_phy_init() and
> ma35_role_sw_get() when regmap_read() fails or is stubbed out?
>
> Neither PHY_MA35_USB nor ARCH_MA35 selects MFD_SYSCON, so PHY_MA35_USB can
> be built with CONFIG_MFD_SYSCON=n and CONFIG_REGMAP=n.  In that
> configuration, syscon_regmap_lookup_by_phandle() always fails with
> -ENOTSUPP, and the regmap_read() stub returns -EINVAL without writing val,
> causing the compiler to flag val as uninitialized in ma35_usb_phy_init()
> and ma35_role_sw_get().
>
> Selecting MFD_SYSCON in PHY_MA35_USB and checking the regmap_read() return
> value (or initializing val) would avoid both issues.
MFD_SYSCON: valid in part. Neither ARCH_MA35 nor PHY_MA35_USB selects
MFD_SYSCON, and with CONFIG_REGMAP=n the regmap_read() stub returns -EINVAL
without writing val, so the compiler can warn about val being uninitialized.
In practice the probe would already fail at 
syscon_regmap_lookup_by_phandle()
(-ENOTSUPP) and never reach those paths. The missing dependency is the real
problem, so in v9 I'll add "select MFD_SYSCON" to PHY_MA35_USB (it selects
REGMAP_MMIO as well). I'll keep regmap_read() unchecked as discussed with
Mani, since once syscon is guaranteed the reads are plain MMIO and do not
fail.

Joey
