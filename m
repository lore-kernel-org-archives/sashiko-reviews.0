Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591642;
	b=dfxQJJokgZbRI7cI+21qHpllHp4cVDFXJA7DWtLQ3nEXCPipFrMN+MrOk8aFE/y5VWsk
	 +7leetjJYGbiMt2xv+0ZrEfs3N8hTYPCSSK7ofBnYv6oIC8o2TZI54Dlpz8voY5Xnd4GS
	 IJuisVZ/bQF+l4QkHN64JxnuJ340MpsaaqHwf96trANDCL7qo54TrcJ2lSkZGK0mSqfb4
	 AYiX9gPpYwypDTohTSAwwIrbEB4IKp0D5ElCDa/WPPd1UnKrdBcqypV43KitB14KXTFu+
	 goObYncUCHyn2pe3zdTXUJfzPYMyU1DGJ+ajKzWsPzRmpyPpTm5t21mOAJWvVB1hhcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591642;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:From:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Language:
	 Content-Type:Content-Transfer-Encoding;
	bh=h/tGrN3vAXkF4xhrgSHBlBodyDLosDfdLftjO+4g2gc=;
	b=vbuGBMPvXk9yfJgQdfHNY8zJ4+AWBj3Hhz1Vlr1XXKgT+IxCgF/0t/GUPRnU/b42h9zL
	 M6SzQGUZ2udqbrp4g7XiKGn18FWPsOTflTroHFOF92B3HntzkR4pbq3kumS1GZXcTLL7p
	 ER+DFfUKEKgM/+xMum47GHpfR74rU1ThtNNIyk0OtreklQc+cQL3wr+HIVQ1zTRZiWAUI
	 g+CskuuHChJe4HkwJKB4Q+0HPEeNc9ug72eC14e5hLUkdPtVk9Lh8snQSYusnQeXY/GTT
	 immpIjAWQRPHeib1iHdunNlaUdbXR630WNWbIic1MT+mzL27ROG9uUnN8kJ/6wZeWhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cKxGnFIC;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC51606A31E
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 14:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AC51606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cKxGnFIC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792591640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h/tGrN3vAXkF4xhrgSHBlBodyDLosDfdLftjO+4g2gc=;
	b=cKxGnFIClWugHa1o1xIB/ztnJpY8dNxh9TuaXeGdMWoTz+C8tXOeCxiiGFYg7WZZWpkvKe
	SDgqUiopr3lCVkPaF4j8fkB40MGr52DQxBHIWBGFUaBWBU+0t+//6rFFusCayLRDnH9lqN
	7JqJsCtj6lEC2ELxgHDJlvb4WZLXYCs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-iYqXcdjVO0qMDcmzGs6c0Q-1; Wed, 21 Oct 2026 14:07:19 +0000
X-MC-Unique: iYqXcdjVO0qMDcmzGs6c0Q-1
X-Mimecast-MFC-AGG-ID: iYqXcdjVO0qMDcmzGs6c0Q_1792591638
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1e672580aso5780415e9.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 07:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591638; x=1793196438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h/tGrN3vAXkF4xhrgSHBlBodyDLosDfdLftjO+4g2gc=;
        b=GmTsu3D+DcUmYHZCge/8DJAPEcxxWU2G1YUCtdRreAVAC9f0f/dQ6Ac0L7lVl9r23r
         EfFFHqTkM/q3tZoz6XHOczFUWzvWXyX8kdJYRA8P3KXSFU74GQ/jvw/qWO0Gf1HBq3SY
         gf5CxCS/q6lAHWJ7ppnI4wRMyQ/cMHQlXWTzeTThwOcpg4TSvESWmbE63uumo8UZ0lRU
         pRRh92zkr6NfehG+WkWGMhULaJ3PAkl0UUIQTJ806yJtkD0kcuVW1fvuAaTU026wdm8J
         xsRC1FAnWMn1vmBNGKkrLWRrpXCDvlhkE/4/oZetUeE4P1fFyl9zCBKE8pFEIJI6dxp5
         kFUA==
X-Forwarded-Encrypted: i=1; AKwUvBxvg5WQe733g51pSHv2SaOprK3rlZHSAf+thpT+EusMliTSjVO8pbxON4ySXAsWuuEOnkkN5/YR0Xg3zxgl2Cw=@lists.linux.dev
X-Gm-Message-State: AFq9FYKCDa72MeB4hzQd5njbBrMRUsnqRBVSJzbdXIrhzday38akYINZ
	c0f6ZwtWx0N9FChpVgFeUyXBnXd1rDtXWNnxZ7mzRpqwsUTU3/vvs/sjEWw6SLlnnqfT34xzFui
	0Fpaa8YnsNsHup3RuI45ZixXyvw1YAi7jfM2PlYcPA4qwpYnBnXagstb49m/5m+1AqJ+I/w==
X-Gm-Gg: AYBFou0TR2zyj488FoYpmexvrTzc4nfIfoOKOMh29zBivY6QYfbFxh3YhrmmTw2MJu4
	Xs/nd3Uht/HusQYY1SvPZB/lGqfUlt9D1g29a0IdNhIJncARhV4Gi2UQ2mimbbU4mvlwNlSLj+7
	HGbHS5uvQumbggH7QaO2ZQVO6+k06C2lvGN6C1YZA9D1X56jUWMXo8eUpwO3C2Y7DpVvfCjgfVA
	z8RkKP93YmYnh289web7qAtekAjGIvJYTWsJusk+8ObNpYYjvvz4Fq+3/E5EAXsu17RIZkW2rq3
	cznBDMeuQIiL6xakDAs2JGnX9jctTpXYKNFv33ciQ9mGvuvzVAl+bniYF46HJnExfLvNKu3hlyR
	Atj1SDr/NlrYz5H0zQGkkbGg2swujA8yUuzF83kXLJYKrOj882db+HqdPezhzZ9OhbYDvPHmHoA
	==
X-Received: by 2002:a05:600c:3f0c:b0:49f:c199:e1e2 with SMTP id 5b1f17b1804b1-4a1fdd39fbamr45863865e9.28.1792591637599;
        Wed, 21 Oct 2026 07:07:17 -0700 (PDT)
X-Received: by 2002:a05:600c:3f0c:b0:49f:c199:e1e2 with SMTP id 5b1f17b1804b1-4a1fdd39fbamr45861165e9.28.1792591635848;
        Wed, 21 Oct 2026 07:07:15 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fe5239e9sm43986055e9.0.2026.10.21.07.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:07:15 -0700 (PDT)
Message-ID: <08a71c7d-d5ba-48ee-b80c-7997d07e6e22@redhat.com>
Date: Wed, 21 Oct 2026 16:07:14 +0200
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
Subject: Re: [PATCH net-next v2 3/3] net: ethernet: qualcomm: ppe: Add IPQ5332
 support
To: Til Kaiser <mail@tk154.de>, sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org
References: <20261016152449.934312-1-mail@tk154.de>
 <20261016152449.934312-4-mail@tk154.de> <sashiko-outbox-175580@kernel.org>
 <c40f4d8f-223c-441b-901e-5bea5bcb612e@tk154.de>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <c40f4d8f-223c-441b-901e-5bea5bcb612e@tk154.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CPgFnfjDVIc9VQ6PBa7vasaGNiQ6cAmL56er9vHBdz4_1792591638
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/26 20:37, Til Kaiser wrote:
> On 10/17/26 5:25 PM, sashiko-bot@kernel.org wrote:
>>
>> [Severity: High]
>> Does ppe_config_qm() calculate the multicast queue register address correctly
>> when queue_id is >= 256?
>>
>> In ppe_config_qm(), the code calculates the address like this:
>>
>> 			} else {
>> 				reg = PPE_AC_MULTICAST_QUEUE_CFG_TBL_ADDR +
>> 				      PPE_AC_MULTICAST_QUEUE_CFG_TBL_INC * queue_id;
>>
>> Since queue_id ranges from 256 to 299 for multicast queues, and is not offset
>> by 256 (PPE_AC_UNICAST_QUEUE_CFG_TBL_ENTRIES) before multiplication, does this
>> result in an out-of-bounds address calculation?
>>
> 
> This is the pre-existing issue you identified in v1, affecting IPQ9574 as well.
> I submitted the fix separately to net:
> https://lore.kernel.org/all/20261016150140.929729-2-mail@tk154.de/
> 
> I could also mention this in the commit message or add the link to the net series
> in the cover letter.

Please note that you could/should ignore reports from the global sashiko instance,
and look at the nipa ones (clashiko)
The feedback from the global sashiko instance is incorporated and validated by other
models (which already discarded the above concern).

This series does not apply cleanly to net-next anymore. You need to rebase and
repost. Please note that the repost MUST wait for the end of the merge window.

/P

