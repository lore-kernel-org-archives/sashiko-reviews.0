Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AE141D224
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529096; cv=none; b=FTeMKKlhEYUM/PkZyq97FeMjvnIE4Ah9wBQg5Vs+I6S5fgjH+mk8ezDS14giqRTt6VgU731MgjGU1l1V7MP2Xpxfzd68BpyLYT2g2f3OWYpnTS3O6sLtjg/ILSCcV1snMJ+ps8iBXuJoZE+jtdmjJCgrfK3nU3IkjRS9Vd7lXEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529096; c=relaxed/simple;
	bh=/WMu+TKiJNlJn0rb2awbrwn77rjt7gRxv29dNWwDecI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=qC5vCTnCaO/9TPdPXJYQflwAQa+uWz/2cOvA9YEw22Z+j7CIMhcf2mSd2WBgn8y4qq+jDf57gD3MwPzm1gqIHWHhFf0rE54YXzVfu2BXxM+CqslWYLq2aJAIi/g/fNz0NnMdaB5AyjbU/09FIKULVDop47PBH12cGcc1WXZVwJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=wWPONr5b; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="wWPONr5b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786529079;
	bh=f3WcLRh1tBh5530s0LTa2dD3hV2Ym/s5q6kPxKGTU3w=;
	h=Message-ID:Date:MIME-Version:To:Subject:From;
	b=wWPONr5bP5WNTyN8KKHGGg9DMhN9zUnBSp3bduyzxtAB2eaAVtYrjLLg4e7or5psJ
	 87OtOxyn0/xHehhdDVlwpqhQSHuJkZB/BrVm8yhUEGmQnGFcH9t3xQH7Y48VuSlfj7
	 +/DPXrKZ8yXdmI+uSOl4ysp5lYDCJtopgQO1u3d8=
X-QQ-mid: zesmtpsz5t1786529073t978ddce6
X-QQ-Originating-IP: nEgdzsPd3ZsI2QsHauhRlSqgZ0oPg6Gwj1Lkz1HVGn4=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Aug 2026 18:04:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4212582248752938954
EX-QQ-RecipientCnt: 6
Message-ID: <258DBF747B7DC4A4+78f75b27-4006-4abf-b5e3-1293d1c514bc@linux.spacemit.com>
Date: Wed, 12 Aug 2026 18:04:31 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: sashiko-bot@kernel.org
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 panjunzhong@linux.spacemit.com, robh@kernel.org,
 sashiko-reviews@lists.linux.dev
References: <20260812094134.CDCF91F000E9@smtp.kernel.org>
Subject: Re: [PATCH 2/6] usb: chipidea: usb2: add optional reset support
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <20260812094134.CDCF91F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MPAlP4yRn0xgkt+DdTn0k33hme6oUcFo7Q9mcPWiiuj+qfAdiJJ6sg+g
	IJjTCUpP+t2T6IE3vWlObF1PFl8gKZN/B4KNfinB1CNrqB18xMz2rpdJdckIpPk+zAYGiwt
	AnaLZSC2nsUKNZwstKwtfR5kBi8TiNStHjAIaFy/seDdx6L26ktaV1ybUTnEXhEqCYlSQ9N
	a5HwOzgPx5mBX64w1Uk1SsTtUKuoFocrnmog4svCmiWYskXwYTMhZsq0hEI9RD10WWFQYNC
	jZSUWakbFgy7Z1lPfG9LLph7zq40MU25byi5nxzdzkdmvEgImBlePgtneECn0Z7VY7b3cQW
	r3K120LLZpu2NIngrdYDKt9hIhYExR+Er9ipyiMiiH78GEx6o7seOCYPpWYvFoKVtQmwwuW
	amSRcSwksuE0Xe6xu5oJdDkKcbS2BI2wwUw049P43QXKOVo/PgIpDiSrwlKDUI5/zQoorrI
	LrIHXoOhgpbjgH/fwROptqT26c7VbCcpdNubQwBK0wbTvSrS9BNfgZIRFS0ZfPLTBDdCF3T
	GnakzSb0XOBh+er/eVpXS1CxtnTahtlWrqhXfNd/SMlUC9b2ty5wlzrbd7ZZ4CVZq5nS8HG
	sYnVTeSVxv42YnGxHBUXnr3Cyc0KtFYs4xqXszaZqemIAFAC4Luem00ylX0yYBWn1i8/OAg
	n0XM+ssMyuVTxQ6xIP+3Hub71NJlsnCIc8bl/B/QGHhKgtmVlW5dc8Rtrzn2HvB7oswQmEA
	8fUzHhpF/YHqsol81lID/o1eLFoC3u4Fb0chcR3r9xs5IEg/0oyI/XH6h112uWKKmgW/k8d
	zmqDZDdjWtglFChhkSwqA9lQGm5XQLJiH/D6qIHhbSJCcgeo8IFohAdmktDbpA1d8Xhv0kk
	j3Lj0bzYJt2pJgfDYWIZTRQ8WDcXo/p2R7sUv36+EmrwGPlQlMCXj2oLdFKt456BasdmcUP
	h96H7om0ugXEY2SE1CaTJfrxGu2aRmh8GPaVHjPw9UOfjibJNoF+WgZsVbu6uqoJwwoCUUf
	w7NSF27I2ClWAmqvMgxQa4ttM3G72+26Lpd6W+KNLgmNt7AkxLfg6MaEE4IPg=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

> ci_hdrc_usb2_probe() {
> 	...
> 	priv->ci_pdev = ci_hdrc_add_device(...);
> 	if (IS_ERR(priv->ci_pdev)) {
> 		...
> 		goto clk_err;
> 	}
> 	...
> clk_err:
> 	clk_disable_unprepare(priv->clk);
> 	return ret;
> }
> 
> This means the reset will be asserted after the clock is disabled. On many
> architectures, asserting a peripheral reset while its clock is disabled can
> cause bus lockups or system hangs.
> 
> This same inversion appears to affect device unbind as well, since
> ci_hdrc_usb2_remove() manually disables the clock before devres runs.
> 
> Would using devres for the clock enablement ensure standard LIFO teardown
> ordering?

Okay, I will add a preparatory patch to the series in v2 to use devres for
clock before the reset patch. thank you sashiko.

