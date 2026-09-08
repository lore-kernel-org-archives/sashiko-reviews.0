Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17A754DAE2
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 14:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788878101; cv=none; b=SXaaph8AMqvuK5ovJ80Wsy0YWB1oQYYIJFAukGYzNmXw6Qudz11dkz7jhf5NDorlT1OaEaN9QUIWA6QkGuILqbHTs5INgxkVaKdhIkY32bTRegpIfFMBa7HD+cKRbyBWBOlw3v2UtuZg8nXEZCdafyP3yc2f/PjZ+TJSGq4jsCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788878101; c=relaxed/simple;
	bh=5OoymxO5vNcnF0bjzul1XaRAGkLV7l75YsaDb7h26sM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LCTZVvmvT29O5X7Lg4ThC7OKKwFyyQfZ+IuxlpuN8PKKQUhtxCjjkl7HdQrod2PiZW3DeuQYVfwaYCRrXjRGxEXPgwP0UbgCQJQU6V0y8/qvjzWVIq1Qk0zKu9ojib9rmBKvBOwBiQ+fSzFh7Kqj2dcdkH/XFcETsacLjDGROE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N8ln6XJe; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N8ln6XJe"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd6185db7so7209985e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 07:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788878093; x=1789482893; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0AhYrfnw2FLiSHKTmeRhquOA1Zcxh/wrV83CYUv+wmY=;
        b=N8ln6XJeWdbYJCHDmJo3volLlYn4nGefsCOUEX3AAhv3aGP1VGP+2FRp/qi2YBg2T0
         VFZAsKC8M/BKpkhzirv5ElOw4gJPfUyWWYrqVtGO2wGc07dTT2r2d1agKjtmeSRoURFS
         kl4GhqbLa8bGtzIXkV8EbxS2C1y+howtUTCo4utshTXNHokhjEzw6Ve1Rpzv/lPLRybn
         p/0nM6uAMoz9ypYilPVRr8YxLDVJ9M2p45880CvlAZm27W2EzsapQLGwhw+b+DXJLqL4
         vbCdxonUjYHvrc6r42NmllNcAKzWH1BSNMFfQpLCFpB4+r+//oON4cWE012M2bt8HNrP
         E7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788878093; x=1789482893;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0AhYrfnw2FLiSHKTmeRhquOA1Zcxh/wrV83CYUv+wmY=;
        b=KcvnbAmFPyBrduhKYpBkBvgBM08WkZSbV9a/vlwmYaoFPjg5OZAqh60ewlr4FyTqME
         Yf66JF96E28Ucvb/KcTD1/mqvsQ6p4Ps9KCoFu6nESyj10q/1FccnjYMb5Isc/HFpsJB
         GBOMbvQijH/pnpCJoe+lFO60GeNvhKDDorl68D/gwzAGUufgXpkuY3scE8QwOkXKuTXY
         iShA3g9SJzM6k42FKGCmkxnKxTDkQ/JEfwlIjSXwmmGgaNJ/iRzAhD5/tA0Lq5Nn6j1X
         ujaVqIFWeocqINbveU8lQ37xtTc5USNZzjXswEjWPkCu3ucSmsVDCc+2nIv2h5TjagnL
         jSfw==
X-Gm-Message-State: AFuF++n+eJ3RYHGdsxvHU9MLRYMgpTZ0ifHCZaC1wc5Uo0bfUjrmF/Xq
	airdYX6ZY/04N3Tzmh1jucwQSyCfqHfVT+TNYXLpDiwUAP0c3xSrq6UDe7ZxPnaFLQZI9K3DHvc
	azDF/QO8=
X-Gm-Gg: AYBFou0iuanm2YYNTY/YlL+xaGQ3uv38nG++WZO4Yi/GTKdx7c3Omd3iGEJe2m8DI8l
	PvFd+9THOTJSLcdiRlDcAPMWNFzI3gO7rnRINgO4M0orQBMpeYvfq+o7N6wDyS/naxN+LLEs5n+
	Tj4trqGwaQkKpiTD1K0Il/Eg7FbjrpguRXileSefvv5VqNNOrhxwA4vaOAZ53e0UMYpOXjxlUfY
	pv8/1uL8HQpBtobzG6hlwYfvkZBIAk2ckwAJTIC2qVIsh08kyU1YetNh4vG6MoX4XWIAaNYfe6f
	dsdKPTsDKzYNOijpkjt7iGxHG2vFNmXyUJ0DiWokOEDVNyHMYqJdThim9XvGOeD6snQ9l76MLEq
	9MQJTXl0pWVZbv0tMv1atTheWA+EBZ/Mt/hpV9gasAYh6GvH0kbC+aaiYzrK6bHfDeE8tgmYBRj
	LpzK084hKJl6BQRlq3cVFfFxF9+dusbeXNpreNaqS9eqNo05wCKphTWu2gevBreaeU6t/HOssoj
	cWKsLuQQwilyg==
X-Received: by 2002:a05:600c:1908:b0:49c:f13e:e4f with SMTP id 5b1f17b1804b1-49d1757b03dmr65089625e9.12.1788878092317;
        Tue, 08 Sep 2026 07:34:52 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7fec25sm563758395e9.13.2026.09.08.07.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 07:34:52 -0700 (PDT)
Message-ID: <8e426afc-b534-454f-9880-2b25764f370a@suse.com>
Date: Tue, 8 Sep 2026 17:34:51 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ata: sata_dwc_460ex: Don't enable interrupt if libATA
 core registration fails
To: sashiko-reviews@lists.linux.dev
Cc: dlemoal@kernel.org, linux-ide@vger.kernel.org, cassel@kernel.org
References: <20260908141538.731237-1-nik.borisov@suse.com>
 <20260908143042.964151F00A3D@smtp.kernel.org>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260908143042.964151F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8.09.26 г. 17:30 ч., sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> 
> New issues:
> - [Low] The patch introduces a `goto err;` statement in `sata_dwc_probe()`, but there is no label named `err:` defined in the function, resulting in a compilation error.

Fair point, however I'd like to hear from an expert whether enabling the 
interrupt without properly registering with libata core is fine or not? 
I.e whether this particular fix makes sense?

<snip>
