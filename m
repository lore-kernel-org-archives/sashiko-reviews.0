Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536741;
	b=j2rql07QBo8puYUDub71vNgiIfpWOvfuQGa4tooGOPDOOyYAiiR2sTjSf6I/QuVa98Ey
	 bIuR6U7KwO0mAwC4GZStYXthi+eUDdUyzy9T3ucypzCcrIhGZJoeYVlNv6n3hHjE1qUVk
	 R4FkqOIho3YfyqazwlICEK7K+Dz9iOvVdjqUiIceW1jE4dqc6xWXlGn+MCqnoLCZyNMbC
	 WbkJ9ocG8JIGdmedxmAZcod+lhNzTZ8mYjsRXpORKRJbWyvhrX/ihAWaopQsOAazZy6rO
	 RXmSdvbUfhcGTcOAxfrEqVEx35WqyFv4iDRwa1FoF2xCWWBH1dJ09J8q01syLYsh56g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536741;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=mfxyhHpDgPHQrMtBpaQ7w/J2fcZS1mPl8U7GSkD5Quo=;
	b=ley/jUjaaB1tqSoQxg3x+uqQ6PfaZebQIWrqdAs5M6OFMKSZX8lhZw7TE0nmby0fsRoB
	 lRTxFREqSPtTiXKF84V1Wh2hD30CZc9GXIy9qc5k4staSj/Vt8jlIH2W1FM9cebVdaBOa
	 cAE9NRXeIY5/eP64hJ3ouZCZpZzBtjvtAs/KSCA9T7ltyBYuJVS0n1HzYlwgeUhPOnov3
	 vZd+degcM5ySeqWFHVDClB9FomaBIVBnurYXe128ynwxDMVCX1MEiTOVCn9Jjs/GRSCUS
	 AFUPgAaygDgIUCUnUbIaevDj4VvTHsfcXfa/2mVR0SypujmURopPo/46kMvifn0jMRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=E3zFfLmt;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C0C606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 16:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9C0C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=E3zFfLmt
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id VpclxYBbfAR1iVt80xjHtm; Tue, 24 Nov 2026 16:12:20 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Vt7txJYR2dRrRVt7txs57I; Tue, 24 Nov 2026 16:12:13 +0000
X-Authority-Analysis: v=2.4 cv=LOhmQIW9 c=1 sm=1 tr=0 ts=6b05b763
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oHgWFVQ-bDsDxEs-_zMA:9 a=QEXdDO2ut3YA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=mfxyhHpDgPHQrMtBpaQ7w/J2fcZS1mPl8U7GSkD5Quo=; b=E3zFfLmtmh/p
	CkR9GnM+uSrEDuvlCQLyVTP1ncjbNkkN4/C0I4SWNxdB87Ep3OUU1Um3nbHNadR/Iee8vmIrSmL09
	IN0jCv+BS4FgVSFbUopQImZ5Nn+qdtIM3w5D5Tj6H1jECaR/oKHCxv0VxfrCGDAUEFNldz9RFrBsJ
	s4r86C6UUsB5SbmXAx7lPWiXEs8EcROccSh5urVyfmCle3i5rPtHjQQnFJ5c+047cthrwXbKxlCXk
	0WNjK0g3Lx5RkhM5xSA9d4e4TuIOf62C8LBRvj3Zimiujei4a7LlgMrkNscxHu1hNycU9vD3q7h6n
	5m53v1wPX9YJr/UzM5C2Jg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:39812)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVt7t-00000001feA-0GaA;
	Tue, 24 Nov 2026 21:42:13 +0530
Message-ID: <fa2fe9f8-04be-4692-97be-04e70894ab20@roeck-us.net>
Date: Tue, 24 Nov 2026 08:12:12 -0800
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
Subject: Re: [RFC PATCH v4 2/2] drivers/watchdog: Add RISC-V SBI watchdog
 driver
To: sashiko-reviews@lists.linux.dev, Prajwal N <prajwal.n@oss.qualcomm.com>
Cc: linux-watchdog@vger.kernel.org
References: <20261124131542.613271-1-prajwal.n@oss.qualcomm.com>
 <20261124131542.613271-3-prajwal.n@oss.qualcomm.com>
 <sashiko-outbox-231227@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <sashiko-outbox-231227@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVt7t-00000001feA-0GaA
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:39812
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOxU/Jsc+EZxJtdyHS1+q3gOe5slc9JC9at6ts942TrLanCDk/JemWpy/Wyw6INBL2RFMo77IkOa1jP9IVwGr1r7sMJwFlEredqtAS027zYXFtgMMsd/
 ZRDldLnLnFNzzmTrB5tuuFxvVSuSySgI/R+IDbaKUYxdUAeID/zesbLulb/XKGv+RH0Z9qWZVUc65cDFOGKp0WJPwEaL/3S9bmBYMS19AFyQeOuw2OdiQLDW

On 11/24/26 05:37, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [Medium] watchdog: riscv_sbi_wdt: unclamped timeout bounds in
>    sbiwdt_init_attributes()
> - [Medium] watchdog: riscv_sbi_wdt: stale firmware pretimeout in
>    sbiwdt_init_attributes()
> - [Medium] watchdog: riscv_sbi_wdt: missing running state check in
>    sbiwdt_probe()
> - [Medium] watchdog: riscv_sbi_wdt: probe fails in sbiwdt_probe()
>    without S-mode IMSIC
> --
> 
> commit 7154e44eab330baa1ded9a131b702c04ae8a2530
> Author: Prajwal N <prajwal.n@oss.qualcomm.com>
> 
> drivers/watchdog: Add RISC-V SBI watchdog driver
> 
> This commit adds a Linux watchdog driver for the RISC-V SBI watchdog
> extension, including MSI-based pretimeout notification support.
> 
>> diff --git a/drivers/watchdog/riscv_sbi_wdt.c b/drivers/watchdog/riscv_sbi_wdt.c
>> new file mode 100644
>> index 0000000000000..8e3db98547882
>> --- /dev/null
>> +++ b/drivers/watchdog/riscv_sbi_wdt.c
> [ ... ]
>> +/* Initialize the watchdog attributes */
>> +static int sbiwdt_init_attributes(struct sbiwdt *wdt)
>> +{
>> +	int ret;
>> +	u32 attr_val;
>> +	u32 timeout_usec;
>> +
>> +	/* Read watchdog capability from firmware */
>> +	ret = sbiwdt_read_attribute(SBI_WATCHDOG_CAPABILITY, &attr_val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	wdt->attrs.wdt_capability = attr_val;
> 
> [Severity: Medium]
> As reported by Guenter Roeck on RFC v3 [1], should sbiwdt_init_attributes()
> check SBI_WATCHDOG_STATE and either stop an active watchdog or set
> WDOG_HW_RUNNING on wdt->wdd.status?
> 
> wdt_state is declared in struct sbiwdt_attributes, but SBI_WATCHDOG_STATE is
> never read.  If the bootloader, firmware, or a pre-kexec kernel leaves the
> watchdog running, writing SBI_WATCHDOG_PERIOD below can fail in firmware, or
> watchdog_register_device() will not start the kernel keepalive worker before
> userspace opens /dev/watchdog.
> 

If you don't think that is necessary, please add a comment into the code
explaining the reason.

>> +
>> +	/*
>> +	 * Read watchdog min period supported in firmware
>> +	 * The firmware ensures the MIN_PERIOD is in valid range
>> +	 */
>> +	ret = sbiwdt_read_attribute(SBI_WATCHDOG_MIN_PERIOD, &attr_val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!attr_val)
>> +		attr_val = 1;
>> +
>> +	wdt->attrs.wdt_min_period = attr_val;
>> +	wdt->wdd.min_timeout = usec_to_sec_ceil(wdt->attrs.wdt_min_period);
>> +
>> +	/* Initialize the watchdog timeout to default value */
>> +	timeout_usec = sec_to_usec(SBI_WATCHDOG_DEFAULT_TIMEOUT);
>> +	ret = sbiwdt_write_attribute(SBI_WATCHDOG_PERIOD, timeout_usec);
>> +	if (ret)
>> +		return ret;
>> +
>> +	wdt->attrs.wdt_period = timeout_usec;
>> +	wdt->wdd.timeout = SBI_WATCHDOG_DEFAULT_TIMEOUT;
>> +	wdt->wdd.max_timeout = U32_MAX / USEC_PER_SEC;
> 
> [Severity: Medium]
> As reported by Guenter Roeck on RFC v3 [2], what happens if firmware reports
> SBI_WATCHDOG_MIN_PERIOD greater than 60 seconds, or near U32_MAX?
> 
> Writing an unclamped 60-second SBI_WATCHDOG_DEFAULT_TIMEOUT to
> SBI_WATCHDOG_PERIOD will be rejected by firmware when wdt_min_period exceeds
> 60,000,000 us, failing probe.  Also, if wdt_min_period is between
> 4,294,000,001 and U32_MAX, usec_to_sec_ceil() rounds min_timeout up to 4295
> seconds while max_timeout is 4294 seconds, causing
> watchdog_check_min_max_timeout() to reset both bounds to 0 and allowing
> userspace timeouts that overflow u32 in sec_to_usec().
> 

If you don't think it is necessary to clamp wdt_min_period, please at least
add a comment explaining the reason. Note though that "it won't happen" is
not an argument or reason.

Thanks,
Guenter

