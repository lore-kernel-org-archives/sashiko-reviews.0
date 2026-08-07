Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8973D3C10A3
	for <sashiko-reviews@lists.linux.dev>; Fri,  7 Aug 2026 20:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786136304; cv=none; b=QXrpOZvKKMWZJjYPB0FTlYAaPPooXgsQU+52NqkxcWJmDkbkstooNiBvbhfwEOcPGxUSSw0eNDvXm6QiE3Rzb0LhSenBfGhZVTL0ZAMAReigS5/5XQN/d6vZsYBQjGQ1xdM1b+zNJD7Ml1wPohRMzaJdymgY3lKz+ne8yEqyh2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786136304; c=relaxed/simple;
	bh=2JoD3JO2pW5pi92+cVlcHhTmMg3nDMhKO466t82pHT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u15Rcc1k2NO1H+fOi1eF6uiPREsBZlXTSEmF6ZQOtCTX4sof7g/mDL4bfw1+n+TleQdkhAPInOcqvIxKB4GLO+82hSqqkNpmWmA6+RPM9P8NzRBDHdV/enLyHAF5o0TZCVUK+WrlZrvJdaBlpYsBNN0e3IEOVj0xiGIOk7Z8F04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Nf0JE/kB; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Nf0JE/kB"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e7632b193so277198485a.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 07 Aug 2026 13:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786136302; x=1786741102; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kj8kzkNEBS/XA58S5M4C363N701v5oQh8U+/4A1gICg=;
        b=Nf0JE/kBX1P+5lNdYham6d1WWnkQ9ZOl4zBLhOiGK0YyLGBmu+a0kp4t8XbCn8Xbut
         0kxBGD+KYJkcitedeuUudj98qB4e+ijHSAEoYC0Ok/v1oK94viujBOZfU1A866LsaySP
         gOepRmOAV4A6t+MMcAOSni9oiwtWhZmzjPyDqubjbA6gI9xG3fB2cJxKpqkWG3Wv5AqP
         7rN8uehFYrH0XoeeB0QLDmeXZ9q3+9B+Gz1Dv4HE8mwNNRv/7Se6DUcyVpZTpnyRcvmP
         8PcqfKDO7UU4Q2Ppj5xzXveAgHQ/D0j+FO336KW/azfG2p+qJcyQAMILh4I+jfQai1Az
         1GHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786136302; x=1786741102;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kj8kzkNEBS/XA58S5M4C363N701v5oQh8U+/4A1gICg=;
        b=E1BwcDv0WIgI95PZwXMizofiO4YEBVPIHMkC1s8/C31C2Ju7VSX22M/yIb2OHhHn+2
         KEDbtT+s7iB/VtcU1c05MLAGdbKYfPtdx6MxPGVDAW03YHOFywv2uAGiPaFiC6kaEVhw
         JGdkcs3OfMpI8/vn0xfcV8pEdWU7yQMGMvFeP+it2hxsrVjN9dBto9nC2XO7KLTViUQR
         Bb0U47EAKsNrG7SMoFSCe4pOPKX5U4lzMt7mwmGdYKeslMuL7ZOvy914BUSH9UIYoFNT
         5qCHr/QKXa54oL7C8i8plW3zrzadPy6zh0gR3FKLr4jh137RHpja7oiEprH1ZjxmdzUL
         KVoA==
X-Gm-Message-State: AOJu0YyzLn7ugu8ulrUy72dPbTPj2bVfexMfqFMDGR6xrwp29CnF9PoJ
	Yl1m9JA9q6tQXd6L9rJHlbbpD/By7mq+cRs0ge/Me7AQ8ldP2fiFLKBssQRib8h/4Gt71koaAJs
	V2bYVU24=
X-Gm-Gg: AR+sD10smlgztaiT77GTpEuXjeg22balrIkWvL2CRpQz3bZCkaZrAXRjoSu+pKe7333
	g3wFYUxOzjXh4S20JHcKsKbzkLKhtiEZCfCqlk8cL+iXOhKK8qzvRHldS/Phqy+jbZzirddSV09
	f20px8/EEGgGWbNNtfKgZU0fsfyLidc48V6rBFT47x0szO1mU8Lw60S0PckJmdOGjeGNBfhdTe6
	GBpAxBsVAavYrRaJCsrG2nAxoGYRjvamGsC6hy+HgKXGyIbIqH1oSv9iKrCyzW3Wkc5wEMLXkNz
	lmE/XesBRSDXZ+WlDNbRZan3Kj+IJyEwWlURO5FM3D0DJR2U3OYdkl3jHYxb0+wl9jeCwOY1SSg
	eLkMM01i50z/WMLInTpbl/8oCvVcihkWCYYW3Sd9m9tCIIAo0QMXr9rKYmciEZeBxk2ylVLAMfV
	0fuEmdKasMhSp7e38cPKiQKRbbne7x44VklbsFZWJtL2FpxvFcGrtQqUckuXak
X-Received: by 2002:a05:620a:4416:b0:930:9fdd:f4e0 with SMTP id af79cd13be357-9367984defdmr383213385a.26.1786136302464;
        Fri, 07 Aug 2026 13:58:22 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e09dc07sm233090185a.15.2026.08.07.13.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 13:58:22 -0700 (PDT)
Message-ID: <929976b6-0960-4e90-a7cd-f163ecaeef3b@riscstar.com>
Date: Fri, 7 Aug 2026 15:58:21 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] PCI: of: introduce of_pci_verify_node()
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260807194100.455599-1-elder@riscstar.com>
 <20260807194100.455599-5-elder@riscstar.com>
 <20260807194944.DEE001F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260807194944.DEE001F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/7/26 2:49 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The static DT node verification function `of_pci_verify_node()` is mistakenly placed under `#ifdef CONFIG_PCI_DYNAMIC_OF_NODES`, making it a silent no-op on systems that only use statically-defined nodes.

This is a good observation.  I think it's correct that
this check is worth doing on static DT nodes even if
CONFIG_PCI_DYNAMIC_OF_NODES is not enabled.

I will plan to send v2 of this series with this
suggestion implemented.

					-Alex
> --
> 
> --- Patch [4]: [PATCH 4/4] PCI: of: introduce of_pci_verify_node() ---
> commit 29170ab92dd207c740eed74438cd2e09bad49131
> Author: Alex Elder <elder@riscstar.com>
> 
> PCI: of: introduce of_pci_verify_node()
> 
> This commit introduces a runtime check to verify that statically-defined
> (pre-existing) devicetree nodes for non-bridge PCI endpoints do not
> incorrectly contain the device_type = "pci" property. It adds a call to
> of_pci_verify_node() during PCI bus device addition to catch these errors.
> 
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -1265,6 +1265,7 @@ static inline int of_pci_get_equalization_presets(struct device *dev,
>>   struct of_changeset;
>>   
>>   #ifdef CONFIG_PCI_DYNAMIC_OF_NODES
>> +void of_pci_verify_node(struct pci_dev *pdev);
> 
> [Severity: Medium]
> Since the intent is to verify statically-defined devicetree nodes, will
> placing this declaration inside the CONFIG_PCI_DYNAMIC_OF_NODES block
> accidentally disable the check on platforms that only use static nodes?
> 
> If CONFIG_PCI_DYNAMIC_OF_NODES is disabled, this falls back to the empty
> stub below, causing the verification to be silently skipped.
> 
>>   void of_pci_make_dev_node(struct pci_dev *pdev);
>>   void of_pci_remove_node(struct pci_dev *pdev);
> 
> [ ... ]
> 
>>   #else
>> +static inline void of_pci_verify_node(struct pci_dev *pdev) { }
>>   static inline void of_pci_make_dev_node(struct pci_dev *pdev) { }
> 

