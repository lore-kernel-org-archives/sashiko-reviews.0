Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173512;
	b=OtwHm/U8E2BKeJHQMYuo2PSc7ljhlHE03kwxznCf3t/DY7Twnm4ZW5Cz0SYH/4cCKJmt
	 DlBS2dm5euCmiXjCRB58VovR+qMaV4pvn7kWLhxYBk5SNm3yhvCj/t31NDZjDd9tXB+t5
	 gz5fojp1X2QZ/va2Nidn3iV+TxIx97wBiYxYMHm6zUtOvyfTcOofU+XegwqadAJO8aSbB
	 5uE32R0los+Rf96iBgGcu3CLQuv53kHV/J/ISZU98eDlH67B1DFTqlPN7n0CO4hFC/Cm3
	 aIepgrBIljDQmghPWL5JUfqXP0IIr66z2UFx7QK3d8JbQz9aIgfTGDioudt3/EQ+SKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=rBMGVypFbtv6OA3tQuoT/CFxuNnCbyC8FkABPLfi7Vw=;
	b=NJOhLnJXRelOtVPKVEKSYKYcPjkx1tjv2LpBTDR9yi1LVlVQeLfezn0kfLYdGOwY+MVl
	 p/aB5vzYo37IgLRnXGZ14JQDixqbdj9ynRA211t0eEdab0blUgSvpY7vEwI2NyD3m9QvJ
	 +N5aJ6IbIHd0k7W+04Qkk+GvQhQiPZat5sdLMV1N2VOQoVUvpOzIoo53+7/lmSHVXQY1S
	 HUoTSkUFkgfgcMIYx5IALcAMNpV/lzzpS3P7JZx2uhmhSTr2P9dzwtKwtsAIuczljHam6
	 SrQBNDh6TUWWdlTy0FqDl2g6dMewnD/KP/IIygZB3jrgz1twcDakp4RKdwvfoNe8b/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ebpdn4m4;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB784606A321
	for <sashiko-reviews@lists.linux.dev>; Sun,  8 Nov 2026 21:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB784606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ebpdn4m4
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14394530ec6so245624c88.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 08 Nov 2026 13:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173511; x=1794778311; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rBMGVypFbtv6OA3tQuoT/CFxuNnCbyC8FkABPLfi7Vw=;
        b=Ebpdn4m4DC05swREXUYdZ0Mxx1PlQKmf02UFwN2cksHBdCx9+Fl4p2RhDhfuEYvoJM
         kwCB8pLpas9Vbala7Z6cJuXObC2B7C3NEMRMCRIMJ51/8BHjVGvoQ15kdu1eUj2F9JaB
         49D30Ch1fi8rjC1HRu+59XnCIETmR5jXxS3OHRQJ1BmG+NoIwec6vHFrBaGkrfzwgNMh
         BO2F9YiKJCrbPsIG2nyfPOouEM4pKInCKpGvYHAYwQN2K5gz394BCxzxqqg+RvGENRvR
         q7hGpDa68hVA5A3H8ZYrxqY88aR6TNPG7bVgnzGIM9CFID+l5nigRNgMWuURJf9qmclD
         4b1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173511; x=1794778311;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBMGVypFbtv6OA3tQuoT/CFxuNnCbyC8FkABPLfi7Vw=;
        b=hXl4ogMp2A2rP2z7YdffIEcDM0YcVsq77PdSOojFB+MFZMoW9zz3dtAq0WMm+FAKYn
         GACxPEibKL2CZ/B4zlnHUk9HFYLzPqOEY9uFhEqqOxOg7GFMi8uc/hid1w+xxkWUMzsR
         3PZyY8vegBsiZAdOX+GKP9n5SfPu4+5OzpHsiPtMOrqrMVOzHk/s6UJ28Q6xyX7Qzacs
         xsGg1dMMVIdT6np2EhpYWRi40yuJCkh3FGn6aeAq14wHtFvbA+rkAEecjYOFoG3dmCvP
         aM/yPJ0auq76fvt5JwPnGz1OyN3LABCrSG80W5yrtWblucbxatq1Q5jHu4A+AR43PNF8
         ApDQ==
X-Gm-Message-State: APuU4Z8Mr6U94w7DLtshpfv6Zc//8AF60syVzA27hRqei+bgXAZgcWbE
	uo9WNyGaBY/PdIXjfqBF6yMQdTz+69Bg3HM1/CGWUJxNYwTn1jbbnrmyditQtg==
X-Gm-Gg: AYBFou1jthpqbuF82uIo8GXoYkZi76BYdXMmbpQNM3mFj3hDDZelc9j9sLkA0/VY0XP
	rxneZGSE6kyAmvSAwy2pSAhCz77EFsZLJ5qgd4fiR75oVXgTENBtQGFucXLAQT7hV8lXzj2FShx
	W3KGqHO+6ZfX189EvSjyhxge3WSkKVRBVNsGqGTZEp9AmcLLYNyd+XqdLJppXgc+MBKpfjrulbT
	dl22+Nsa09xL9QilXHZkVaJUQ6phhEpmumEfoR2kFU0WslmxGUkaQhm8uAr+2R3m4dxl8ECgoKu
	lred3sm5CqONizD005npOQuQAzNat6divqm5x5lKxu7U+n4hhWU0rL/P7EzzSuiQzcFejza1iJY
	jTvjVXHhFrK+/4BRjRhD3lw+wUPjoCnlBojzsVQ72GAiiNWdOewg07RCFEa1BxvnCmlrgNtC523
	bBGvgvBW00/+dxWt8zzmTz+B/ssYP74GOGgyETRAaO6Anaa3uMZRpn5+Cd7CZfP9tm2056jBTxy
	aPZzccmq3XQ4MzQXSci+DkD3h6vj0bYb6FMLdiHbExni6r0bHlEHSpH6xwSynF5NxmP/FAWq7eS
	bbVsC9NPOYhvBUF/3JF2t/s9yOapHKC/4WSs6engbFOui7lAmi8vABoOp42tWH4tzDT0
X-Received: by 2002:a05:7022:3a8a:b0:1b2:4da6:bccd with SMTP id a92af1059eb24-1b39fef46eamr3757834c88.34.1794173510833;
        Sun, 08 Nov 2026 13:31:50 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37560d95dsm7077840c88.11.2026.11.08.13.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:31:50 -0800 (PST)
Date: Sun, 8 Nov 2026 13:31:46 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Nizat Mikayilli <nacht@dxdmail.cc>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 1/5] Input: s6sy761 - apply the touchscreen inversion and
 swap properties
Message-ID: <avDoui7Foj0eVcaF@google.com>
References: <20261108-b4-s6sy761-fts1ba90a-v1-0-999b3cfaf82d@dxdmail.cc>
 <20261108-b4-s6sy761-fts1ba90a-v1-1-999b3cfaf82d@dxdmail.cc>
 <sashiko-outbox-203649@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-203649@kernel.org>

On Sun, Nov 08, 2026 at 08:38:24AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [High] Input: s6sy761 - premature input_sync() in
>   s6sy761_report_coordinates() [1]
> --
> 
> commit a5e7ac4e0cb3d02e12af7f249f64b3074df9f280
> Author: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> Input: s6sy761 - apply the touchscreen inversion and swap properties
> 
> This commit replaces raw X and Y coordinate reporting with
> touchscreen_report_pos() so touchscreen inversion and axis swap properties
> take effect.
> 
> > diff --git a/drivers/input/touchscreen/s6sy761.c b/drivers/input/touchscreen/s6sy761.c
> > index 1afa38850f12f..967fd222f0d62 100644
> > --- a/drivers/input/touchscreen/s6sy761.c
> > +++ b/drivers/input/touchscreen/s6sy761.c
> > @@ -153,8 +153,7 @@ static void s6sy761_report_coordinates(struct s6sy761_data *sdata,
> >  	input_mt_slot(sdata->input, tid);
> >  
> >  	input_mt_report_slot_state(sdata->input, MT_TOOL_FINGER, true);
> > -	input_report_abs(sdata->input, ABS_MT_POSITION_X, x);
> > -	input_report_abs(sdata->input, ABS_MT_POSITION_Y, y);
> > +	touchscreen_report_pos(sdata->input, &sdata->prop, x, y, true);
> >  	input_report_abs(sdata->input, ABS_MT_TOUCH_MAJOR, major);
> >  	input_report_abs(sdata->input, ABS_MT_TOUCH_MINOR, minor);
> >  	input_report_abs(sdata->input, ABS_MT_PRESSURE, z);
> 
> [Severity: High]
> This problem wasn't introduced by this patch, but does calling
> input_sync() at the end of s6sy761_report_coordinates() and
> s6sy761_report_release() fragment multi-finger updates [1]?
> 
> drivers/input/touchscreen/s6sy761.c:s6sy761_report_coordinates() {
> 	...
> 	input_report_abs(sdata->input, ABS_MT_PRESSURE, z);
> 
> 	input_sync(sdata->input);
> }
> 
> When s6sy761_irq_handler() loops over batched events, emitting SYN_REPORT
> inside each per-slot helper splits a single multi-finger hardware update
> into multiple torn frames for userspace.
> 
> [1] https://sashiko.dev/#/bug/linux-c1c813ff-e5e5-43df-a3c3-af15e2a7dad5

The driver does not use INPUT_MT_DROP_UNUSED so it is OK to emit
SYN_REPORT per contact. 

Thanks.

-- 
Dmitry
