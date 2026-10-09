Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C0C3783AD
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 15:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560936; cv=none; b=np27XQGffCPPsV0/9MPZXwIJ5Psy9uR3KaYcX3KOgCdszyyxG1L7jTiuZkTvYccXdBvkncX0YfgHORkvexVFah9L7GbKVa/Md/juHXUKeGvEu3aW+QGLsmRgDgRPcTx3zqK2BgfOxu0kvuws2cxCWyBYU8hSZPBZ/wSF8nqfa0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560936; c=relaxed/simple;
	bh=s9N4SJWPym+C4tYVnt9KaGPrfIXadQwubQeB0Il//RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OWcBSpQcx8tOuKzitlWlC0e560xlPi8MuxUSHuCygyV8eoTaiyP9LZCJxAY0+ecRnmn3dTPJuWNBN/n72zHZsTdaI5iaGgH+2qp7tetXTIgABGK/xcQ4dm0injo2xrCyB8OilqLqCqcUByctHi+rY6iYpZfP7/oZikr2Q55wJKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+leaE0N; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+leaE0N"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so64987555e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 08:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791560932; x=1792165732; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JXF2z4vyGmmSKHlETLZ0cQ9sneHBE6Aoyzr8KR9FOqU=;
        b=Z+leaE0N+8x6wF45Gw3AoRkpQGq1WJMjTq1R5qNPUrk1R0R+OKCNfOBDq/rWpKi1Kz
         LAXOZaKFIkkfw1cJSKbP2GGxoxPJXrqTIFpDUA7Vrykw2rlXYy4i7pC7ld06l5GqLGWW
         P4ePBa3d4mGlbo/QRH8z4KxpuK+w9TIL3L9YCVuz9bPqCBdhibaqZB124tmJxvqYNB+J
         ymhJPs4c8e3eUXQipbsoZEHYZSolW0/tL6bqeE4y3WC6Tm7bFBHICfo1nEjdqee32ZoO
         LvkdrpdkBMRc2U2sal0dAs3HSvnHkpZRiXZehQ7G00YD57dameLgo7s1RvreG/Ncs9Q1
         3tVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791560932; x=1792165732;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JXF2z4vyGmmSKHlETLZ0cQ9sneHBE6Aoyzr8KR9FOqU=;
        b=HUDGXcykHJqw6ny2YMbC2IY7VnGamEwrec9fGiCmaMwkuUp/gReGDidRyukJsc3RF/
         Ldgdy7BvieF9sGFVWlG/NKRBmMP31TkC/8IpAkC9bmSYgRI+mHJryxB4G/z89kw+GRln
         b1CQ7tH4Nlmh25OL0UNyVCKGXLKwFLUtdBtky1dd2knqyuiiY3I96udk+dhXazWgi4Td
         tszYN1hvtXP1FBD2XNeuISL691KemP6HkIZrVGOlbUGVlj8fIHP6pX6M+KJQsz6U73rB
         g9ditnrM91swUsLp53InnHiPvHz40dYfly7MaN/PeR5hY8IoyucRCwSdmiRdBmsa1Q69
         ljWA==
X-Gm-Message-State: AFuF++lBZR4ei6MmcEl0ppXelfsimWO28dpl6D1uEL2DqQ9UlKpZ5vJs
	s98xu6UtGNEtVdZ9vWbOpnLe7xQZm7j7BURB/pYLOYrMwUotRXWnJsyxjTzEPxUo
X-Gm-Gg: AYBFou0AK8Njb5Zy1dFz0QiCdwBnjJMmEs7u30FV0wQgSoneIQM7JpyzP16kFQo94Dn
	8Rf0NSDXvQtGYF6uYuAy7p7YlOXK0FJwuV+wTWH6kCk0tDPbQg0YjOuIzhdxkA6vbmoGy/FMkIE
	/ZnMIJT5+bQMcuFAOxKj1rtm086w2Mtf/NBLNAgYOOGeoiFlsuxJFGqCAsFEOfT4wcQx7e5q/91
	4yEx37SZbtYK85WmS6XN2XjFQVV2hy3smYTdmW7dgQ3V8FjwOyLGPuMPkKbK3JJsfSB5pi6Ef9h
	3dEbEWYlxMrm0zEVDK/CHedr0oO2CJy6sCzJC0pKlefTr/ly9jhlYQc25uc9Xceo+03XnlwtuVB
	NlPEGabhxUigDJe/t9/BvBzkZI7WLIZk426rkDz6wUJxc7YwdZfAgG1e7e3MJRsKmBteeaVC0lb
	sha50KOSa+kHtjv7sUeT4DJ7xChOanG+gtRmnGPnWeyQmoXDMgrfiRdwgbyT0t1j8wcXX9yZAqd
	rbGVPpKG7/8Vch7XMY=
X-Received: by 2002:a05:600c:3e8f:b0:4a0:263c:704f with SMTP id 5b1f17b1804b1-4a18e4a3fbdmr46298095e9.16.1791560931844;
        Fri, 09 Oct 2026 08:48:51 -0700 (PDT)
Received: from [192.168.18.21] ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm120627275e9.9.2026.10.09.08.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 08:48:51 -0700 (PDT)
Message-ID: <cc9f0c2d-7f41-477b-a1dc-9d5a7146af71@gmail.com>
Date: Fri, 9 Oct 2026 18:48:50 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] usbnet: fix EVENT_RX_PAUSED race in
 usbnet_skb_return()
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261007220311.113827-1-omermetekaya0@gmail.com>
 <sashiko-outbox-164620@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
In-Reply-To: <sashiko-outbox-164620@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/9/26 01:03, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] net: out-of-order packet delivery during RX resume
> --
> 
> commit 7148b0b2b0b945f31b2120d7f4cbc269acf91635
> Author: Ömer Mete Kaya <omermetekaya0@gmail.com>
> 
> usbnet: fix EVENT_RX_PAUSED race in usbnet_skb_return()
> 
> This commit addresses a race condition in usbnet_skb_return() by protecting
> the EVENT_RX_PAUSED flag check and enqueue operations with a double-check
> pattern under the rxq_pause lock. It also protects the clear_bit() operation
> in usbnet_resume_rx() under the same lock.
> 
>> diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
>> index a19ecf718f36a..d1ec3ba1e10e6 100644
>> --- a/drivers/net/usb/usbnet.c
>> +++ b/drivers/net/usb/usbnet.c
> [ ... ]
>> @@ -700,15 +705,16 @@ void usbnet_resume_rx(struct usbnet *dev)
>>  	int num = 0;
>>  
>>  	local_bh_disable();
>> +	spin_lock(&dev->rxq_pause.lock);
>>  	clear_bit(EVENT_RX_PAUSED, &dev->flags);
>> -
>> +	spin_unlock(&dev->rxq_pause.lock);
> 
> [Severity: Medium]
> If a new packet arrives concurrently on another CPU via usbnet_skb_return(),
> could it observe EVENT_RX_PAUSED as false here?
> 
> If so, it would bypass the pause queue and immediately deliver the new SKB
> to the network stack via netif_rx().
> 
>>  	while ((skb = skb_dequeue(&dev->rxq_pause)) != NULL) {
>>  		usbnet_skb_return(dev, skb);
>>  		num++;
>>  	}
> 
> This seems like it would cause the newly arrived packet to be delivered before
> the older packets in the rxq_pause queue are fully drained by this while loop,
> leading to out-of-order delivery which can degrade TCP performance.
> 
The out-of-order delivery window between clear_bit() and the drain loop
is a pre-existing issue in the original code, not introduced by this
patch.
