Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C9949F126
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 15:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262712; cv=none; b=iV5wnWs0wDJUIsEv6c4ANEbSnIjbXMBQ4fpLYX3BEY43srrcvrmaEUAWyPbdIVC5t64DIP6pb0gNDJO6fVwYF7G45GaP2LM+CXW1Ck089sDy7NIQv+H//48o37vRLKTwchlP9G6rOAYNqKJwx8QE03BcxB6yLFjLZIDSWgQ4Uwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262712; c=relaxed/simple;
	bh=rLyOMd/NUGEseSBxyocA0bYOEejNiG1JtJseUmRTyhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HjU1D/ht21tU8u539b55GuPwts1XIzYxG4FW7yObG2XpYQQrIcOP2VmNA/Bs5HCZTKDhrZzCVnYX92sYExsTA3TMKRT6Ns0+LKj1OT1QDH5jCNfeHGZZNGEPthSuv/+TWiBmogeh3PE2Gck6qMaaKeRCWCsvQxj8Wr4Phghr7/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=VukCgcbj; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="VukCgcbj"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcb5cb1so17994756d6.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 08:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790262709; x=1790867509; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=coMqpZSLbYua79ODlaLf8ibI9ASN8s+y7pCadqkcxT0=;
        b=VukCgcbjShpJKilLAwqhzaT9YpRsuYWx1MJ6eWvRqf8FZNUEMBH5ia7yE3wUSAL5Xt
         dozvrmmOfRTHG3JLw+7X0JjO+5c8USrWorHAEOHvkNz2EjeZPh4cwa7FSCR4zQuF2ZAu
         LbWpi0S55+S1gBllzssd8JDxEFHzd6fLPQGcsQZS6DqlqjpwTCOypPDtoVr2nyaJgjI4
         RxQ96ctSiygbAnaVNEEAAAVfcFEd25uhvQaImdmvtGrcHsGa7i8utwMBk/sM9nU2awcO
         CNZmNafywJ7nFPVXnwRkhkS8Y8kJWrkJujLKOkNto/wauVlswrnCAdQNFVzA/TkCR0jo
         tqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262709; x=1790867509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=coMqpZSLbYua79ODlaLf8ibI9ASN8s+y7pCadqkcxT0=;
        b=F1l9lJ9PoHv4Oin3euWSEBuby47BNOyEUzD1PfOCLnCwKbV62myyCA31KkTWvO8hKG
         /xDpmO5fP01OjteG8xkalg9m1floX6oPWQVIQsqyC1qrYcJad4o7b1/gXaPkBpGEdOXF
         b1kF1JgODILGieG3xg4B922Lq03EXkFSaEh1Y1Shw+x/6mnAyFpJZtBKm7OBQT8BxdOf
         bzxOmk2M8OQrT7nIYGRxRXQcH5xSyIMVOjj/1Re9Bb4Mto+WKUv2kfOqKtKeF+HnI10a
         eYpFFQTwDfg2msGtPKUslZUh1zSxrsxrUHMekfzKuhKPr+0kvnRlOdc/rWAN2dWdefLp
         7hAQ==
X-Gm-Message-State: AFuF++nAjCn4/sSB3oSKjaCg6HMmEGjj0Q+VmcFT9fTyHCTsfm+yKS6m
	1Mlo0zSMWcJM34SEIMep44uHqOTjQRyVv41FXsvPRnO6obEnQtSimixn3ezyO+WtupFzV2Bl+ij
	eCKIv4tY=
X-Gm-Gg: AYBFou0/rJtuFIGh8kNZQwM5zMCQzcS6TpDPUmrbmrYRlv33cwPbfFd+CIVn+Wqo93z
	mcc7CdwKQBoiCol4nj5QL4xTiqS0Lax5gAkJF3SSuwnKsBZLOz5MmIUxizEWj161q3PftIvrmiB
	2nsH5tTqHq0l/RdP+p81phSoH+SBpiEJshNOMUPcnBs2iCgVQrBIDcpPYjkcFw589G2kXWVxG2W
	RqEfQ4L5auTyZ8wgsOurneeazn/FDSQ3Fm03uVsHqWdc65pdKF8t69M0zUAUU5I7lykO+6Ao/8o
	EEvFYVgqmiNc4uDuTu/gNJrkmG47PGd7XmQaBAZ3LbLUiqTNcF+0Lw3AThpCXCcvv6hJJX5uZwd
	u9hCwSPCE7A21A7F9+ZaSl+BKN46YVdgO5rW4D6uI4/PSehSVtiQJRUr4lGj/ADWBOkzgP4N7DA
	XY3Ytmona00/TOvATgtADBRXvGrUTxwb4AKW4pSt7D2wE38JWoFrLWIzs2QkRCdWjn/iQZzALBn
	GagbPARpQ==
X-Received: by 2002:a05:6214:3d01:b0:912:599c:a278 with SMTP id 6a1803df08f44-91421ef6d3amr30758496d6.37.1790262708730;
        Thu, 24 Sep 2026 08:11:48 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e27b698sm18523826d6.31.2026.09.24.08.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 08:11:48 -0700 (PDT)
Message-ID: <5a150b72-e2f9-462c-aabd-103659e3bf62@riscstar.com>
Date: Thu, 24 Sep 2026 10:11:47 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] PCI: of: introduce of_pci_verify_node()
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 conor+dt@kernel.org, robh@kernel.org
References: <20260924150222.1179235-1-elder@riscstar.com>
 <20260924150222.1179235-5-elder@riscstar.com>
 <20260924150934.B4CE31F000FF@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260924150934.B4CE31F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/26 10:09 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] pci: of: unintended error-level logging in of_pci_verify_node()
> --
> 
> commit 0e8b20efbbe63f895449027a5712b691b9eeaa56
> Author: Alex Elder <elder@riscstar.com>
> 
> PCI: of: introduce of_pci_verify_node()
> 
> This commit introduces of_pci_verify_node() to verify the device_type property
> for PCI devices. It adds a runtime check during device enumeration to warn if a
> bridge lacks a "pci" or "pciex" device type or if an endpoint improperly
> includes one.
> 
>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>> index a51dff91b196d..5a040ed836744 100644
>> --- a/drivers/pci/of.c
>> +++ b/drivers/pci/of.c
> 
> [ ... ]
> 
>> +void of_pci_verify_node(struct pci_dev *pdev)
>> +{
>> +	struct device_node *np = pci_device_to_OF_node(pdev);
>> +	bool device_is_bridge;
>> +	bool device_type_pci;
>> +
>> +	/* Nothing to check if there's no pre-existing devicetree node */
>> +	if (!np)
>> +		return;
>> +
>> +	device_is_bridge = pci_is_bridge(pdev);
>> +	device_type_pci = of_node_is_type(np, "pci") ||
>> +			  of_node_is_type(np, "pciex");
>> +
>> +	/* Bridges should have device type "pci"; endpoints should not */
>> +	if (device_is_bridge == device_type_pci)
>> +		return;
>> +
>> +	dev_err(&pdev->dev, "PCI %s have \"pci\" device_type property\n",
>> +		device_is_bridge ? "bridge should" : "endpoint should not");
> 
> [Severity: Medium]
> The commit message states that these warnings are "meant to help developers;
> users should never see them."

I suppose I should have said "error messages" rather than "warnings"
here.  I think dev_err() is appropriate, and unless a human objects
to this, I do not plan to update the series to address this.

					-Alex


> However, dev_err() logs unconditionally at the error level in
> of_pci_verify_node(), making it prominently visible to end users and
> potentially failing automated test suites on boards with legacy devicetree
> nodes.
> 
> Should dev_dbg() or dev_info() be used here instead to match the stated
> developer-only intent?
> 
>> +}
> 

