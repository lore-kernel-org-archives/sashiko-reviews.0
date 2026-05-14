Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BB81E7C2E
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 01:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778721659; cv=none; b=Kdycsv0Zr/088RXDrCT6m66NaKOA2zqvmgLgl5siAos5IJGN5diJ0VoXtisml64P/zo4H3DZ31lSR08MlJkRJzhjFZID1nUVsFl+7L5X7fTwxmml/Of/Z6u8WP5zryq5hDRkGN2xJeDTaeHaRLghpPnyoqL+jgaXXcJ1duEi6vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778721659; c=relaxed/simple;
	bh=slEw3KvaooDkY984ag9tHUglDzCiqW0LHTYF2Wnt0nQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJTAwOsfb46w0IyO5jeDRLgvyJsi58TMe30kaIeA7CQoV1ktcrgKelvq719tZfK6ucM0OSx9eFWOV46mHUTHUM5BrT/8PsCSIWUmPnnyh6vIzrtX41ljYGkpuvK4Sy8U8pTgPL5GX/+9vDifU+0tVwUSx+YgclWa/2JKedMbZn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4Uq0Ob9; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4Uq0Ob9"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2f36da5c8fbso7347026eec.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 18:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778721657; x=1779326457; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qLy91Zspdgwq3Y5ACwXU3/2hLqUalzK4wJt+J779ge0=;
        b=V4Uq0Ob9+Dk4D9IpCmRzaXmZPNUxFM31e/i5KAyfgP6HnQx66mmW+SrsM+UYcA/XSW
         Mb0KR2edzCnw6dyii/vM4+0zF6eWxPkrGu9vAufKHj5dAMg3+38KOF/r8V/5Pgs1sWaP
         4ctWf9tBa/y1mo5+QpClMkeyGs3AaocI1RO9ylcpsskuv82VbCHTp0N2Lw78VJfZnOdG
         y8MGZMGupNGAmNUBEssD4Z97aq8VQb12/vjuWz0BCmS74zXcMWm2k8p2WmuNraSTESsw
         1TecPdWZQY0lGrkEcKAOHlbQL+smpG8civyqYHL/QW2SL6L34Us8ekIcEU62GP8+u6SP
         HSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778721657; x=1779326457;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLy91Zspdgwq3Y5ACwXU3/2hLqUalzK4wJt+J779ge0=;
        b=B1+T/hiQvZ1Jo9RJwW13KNltkWtrexNntFQbCk5YUvb59ulCfIk1fbV2SgvtCe9Izf
         W7AayaWUDGWzg8hLi0s8gbuMm3AeoCs/5Nq2WsQWDCDM3aXHQpIPKWqD1/KucgMiFvx8
         YtoK8g0Zx43Lh1WGNrDQ9fmJQ8af010hvj65h8qhV3bzolO0JKoGbbJBzlrGPkiMvbTw
         MWudjG3QRf96iU/oJPqeIuvmLSaDi7lqev0Idq1jyeRl83fVN53OvBApYoypbg/YUtyc
         iCkLckaoqBdw1H2jtdDTttjz2bv3unGDsL7IzUPUKSuOG/315xKP/uC47tZ9ytLSgK7P
         blUg==
X-Gm-Message-State: AOJu0Yx1+IVSHFw76YrdSt8slUXp+Iy/8WeJRpOGE6hF124RtLtrQRRK
	jPKZUZRZLxyLnKzGbgDzQ/A6Ak9MnYfVS8PFXl7cKiTUZFsEy3o5bdpNCZQq/g==
X-Gm-Gg: Acq92OE+Sb2VnGYMSycTcrXBetpBVJZMkA0OW4hgAmkv80d1RJ/x4i3FYsT7hpVhMdj
	GiUkYGBY8CpR4IKhUut0WRzSFkVjwrC0QPX3hiSKBTQ2uGzQZA5LejyXvJJ8GQXHZwzALozrYlj
	ISqYMVZJsqhn3jtCeVXz+OrukRXLm8vgGVxv7RDIYNeiLoX3F+QFH8TDAwI7Ct5tkzmmHXvowbc
	+GsyF/0lbwridy2luHSLktMmvwl+O9jLv9vQL2oGobcXH+dQXAxZC0wiLYYZTHGDTgLUOrvnEZu
	B+TzCcmbB0hDzdeWg+5O2DaJ+TpnUZa7c62VJ3ARFMGFAf+tlXN4P2B9CbuK/ggrJ1JsoJLExUj
	WmnW8f5+peEER+Qbv4M+6je99nc9dwNZ8SIj+zzeIODs2+T04OF2KVrr/s8vLZ8kSQ63dZ5abqI
	kUUiUajpyQgAkpYqKEDbW3Dq4EL0izO7lYf7xDULvnMVgGk07H/EKq75Fj670pUw44ZZktyPx0
X-Received: by 2002:a05:7300:eb91:b0:2ed:e12:3769 with SMTP id 5a478bee46e88-3011a467d7cmr3505014eec.31.1778721656416;
        Wed, 13 May 2026 18:20:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bc9d4sm1132828eec.23.2026.05.13.18.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 18:20:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <110e9a0d-bc91-4959-8a7b-1a055d0b49f7@roeck-us.net>
Date: Wed, 13 May 2026 18:20:55 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] usb: xhci-pci: add AMD Promontory 21 PCI glue
To: sashiko-reviews@lists.linux.dev, Jihong Min <hurryman2212@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260512213910.871859-2-hurryman2212@gmail.com>
 <20260514004055.1BBCAC19425@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260514004055.1BBCAC19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 17:40, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The Kconfig dependency `depends on USB_XHCI_PCI=y` completely disables PROM21 support for systems where the core driver is built as a module.
> - [Low] Signed integer overflow when calculating the auxiliary device ID.
> --
> 
> commit 20f4e35b2f88ebe2b8988b4f07fe7cc28199096b
> Author: Jihong Min <hurryman2212@gmail.com>
> Subject: usb: xhci-pci: add AMD Promontory 21 PCI glue
> 
> This commit adds a small PCI glue driver for AMD Promontory 21 xHCI
> controllers. It binds the controllers, delegates USB host operation to
> the common xHCI PCI core, and creates an auxiliary device for optional
> temperature sensor support.
> 
>> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
>> --- a/drivers/usb/host/Kconfig
>> +++ b/drivers/usb/host/Kconfig
> 
> [ ... ]
> 
>> @@ -42,6 +42,26 @@ config USB_XHCI_PCI
>>   	depends on USB_PCI
>>   	default y
>>   
>> +config USB_XHCI_PCI_PROM21
>> +	bool "AMD Promontory 21 xHCI PCI support"
>> +	depends on X86
>> +	depends on USB_XHCI_PCI=y
> 
> Does depending strictly on USB_XHCI_PCI=y cause a configuration regression
> for most distributions where the core driver is configured as a module?
> 
> The driver source appears fully capable of being built as a module, using
> module-related macros and module_pci_driver().
> 
> If the intent is to prevent an early boot mismatch where xhci-pci is
> built-in but the PROM21 glue is a module, could this instead be a tristate
> option using depends on USB_XHCI_PCI and depends on !(USB_XHCI_PCI=y && m)?
> This would enforce the boot constraint while preserving support for modular
> kernel builds.
> 

That makes sense to me. That would be stronger than using default (which
was my idea of dealing with the problem). Restricting the code to USB_XHCI_PCI=y
seems to be a bit extreme.

> [ ... ]
> 
>> diff --git a/drivers/usb/host/xhci-pci-prom21.c b/drivers/usb/host/xhci-pci-prom21.c
>> --- /dev/null
>> +++ b/drivers/usb/host/xhci-pci-prom21.c
> 
> [ ... ]
> 
>> +static int prom21_xhci_create_auxdev(struct pci_dev *pdev)
>> +{
>> +	struct prom21_xhci_auxdev *prom21_auxdev;
>> +	struct usb_hcd *hcd = pci_get_drvdata(pdev);
> 
> [ ... ]
> 
>> +	prom21_auxdev->auxdev =
>> +		auxiliary_device_create(&pdev->dev, KBUILD_MODNAME, "hwmon",
>> +					&prom21_auxdev->pdata,
>> +					(pci_domain_nr(pdev->bus) << 16) |
>> +						pci_dev_id(pdev));
> 
> Does left-shifting pci_domain_nr() introduce a signed integer overflow
> regression?
> 
> The function pci_domain_nr() returns a signed int, which can be up to 0xFFFF
> on ACPI systems. Left-shifting a value of 0x8000 or greater by 16 bits
> alters the sign bit of a 32-bit int, resulting in undefined behavior in C.
> 
> Would casting the return value to an unsigned integer, such as
> (u32)pci_domain_nr(pdev->bus) << 16, avoid this overflow?
> 
FWIW, I don't think that is a real problem. auxiliary_device_create()
takes an int as id parameter, so the result would be converted back to int
anyway. Maybe use "(pci_domain_nr(pdev->bus) & 0x7fff) << 16" instead,
but I don't know if that adds any practical value.

Thanks,
Guenter

