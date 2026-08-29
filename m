Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2805018DB2A
	for <sashiko-reviews@lists.linux.dev>; Sat, 29 Aug 2026 13:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788008710; cv=none; b=SDHQgaLNsuh010Y3OIq91ykqEzKjO3L4fAlYb7FYeO/6x1pR6FzXKBbfxB4E2OGYE5cdKRTynnrgakT8TZ34x8x+XFtArixubmE3XQ79OcW3ABwOxJO/2my+YcznPDCwOrUaNq8KGafx522mN/5Q4dAq0HEP+O6+cJ24kwAxtzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788008710; c=relaxed/simple;
	bh=blL1EP/g8mK6CPayMFRENKyzIlwBWcD1SWMYI7+Z/gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UiPb9w3Jzoj7k3IAltCmx0M/Q4MKpP1D73Np/KTu53P70hOAxXNSWL6vRc88JZQobx11maYVVygxhlM+adVTZeei48CeWbVb0ycr/gYtscmUCHo8pMZ1HOsupDJl/bSy83bhsrMtWxOhxZ7DpGs0PKvyrMtZzFe/zt2Hsn7wJcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qqmeGc4Y; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qqmeGc4Y"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1c9879395so1490403a12.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 29 Aug 2026 06:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788008707; x=1788613507; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wWzq27nIKuCjDvG5d26Jt7oNUlF/uxzezevKAoy24eQ=;
        b=qqmeGc4Y+0h9zDyzdiwiQ7XjbbelH+ByLG4qFTnRqbGA8tWn2HFhNOVlJEB2XVBXss
         SZjsey3gnrr/lWG7LDAjfewgHQpv6P5g64d1GQDucMxGcYv5rW+V6VXivKK1321ntufH
         0KXmWWgpMfvPbCceLtLje9xQwsZ/nBpXlqySYEtdKTCNFpKu2pfc48Aea9EXEq9M+Xv8
         dlbUzJUQlQB0QO7b3cpBX1mTjG2gPIHXpvPmrbG4AU6+oT9hhIX6Zqskim9SmHUtqrxD
         zUc9Nwr+wnGsrKuQky9rD2ftZ4wU9gq6F7iNFWhPoQlRmWIcAYuMH/OF+qvf0M30X8iN
         xwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788008707; x=1788613507;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWzq27nIKuCjDvG5d26Jt7oNUlF/uxzezevKAoy24eQ=;
        b=FSo5O5vBk6bvmbW1ErHZ7HZyhCdbq2BMiJosXXsdTCnPUaALtQymsoTyB6t/bUJCxr
         t3yl7JhDE38XGx6Hz8LF527GgLRVgr9zMWTV6DtliUryS1IREeNp9JUbRuVehmkqm9kB
         OP6sY2M6r/gFWUrhDZEJ/YEhBTJTwsHDcKRJcZV0u4as8v/hs9tDnRYo0qNkYJlv+7o1
         6BAENyVPrHgi5AtBTPygYO1LZRvXFMq8WaxHsMeXLF2xQSD+mCBB4AhkRsUewRh6FF/q
         G69NUqhK83ilRehONTLw3QDgeQc3UEvoMbH8ZiEK9j0rZX7sT2EdbxGYu8I2EWNtLfg5
         L/fQ==
X-Gm-Message-State: AFuF++n42ajkNGwJ9UrqhA5n0unwH709bt8T3t4Cud7p3YsB4VBv5PfJ
	BLtz50LmZUiLRglnHQfNH1ck4fe3jP2SI4jO5rzkuZDVoEN42eFMi9ozE8TD3RaZ
X-Gm-Gg: AYBFou3dQXHSfX6WMsJ2BKA0a3y762HfgH7q87N3ccQRcs6qfunpGyCjiE7EMmUl7kL
	v/jNyztvXqKNZBx6L3fpL0nWfr1Rt4KrcwOTWsYFVLZ1G3FcyORrxApQ9Iaqr2+YfPE39zTNTGN
	psiSqsm9wuW+qaWtDzKiOIOYBl+yXu6Rl5ihnuXW1RkFi/wb7dmsgGD8WEYF4+vIjq4BTjdgMYq
	SOl8WjHq2datq84qcZ0rJ9vOJtQOsskXpSH1fQ1fFbjlFWEW+BALUbZVQmYGV1iRZvsx4eiHlHc
	jMG4/y5nghzA+avne+5aS5YHCTHFtgeuNtZdknBTL5vqUlliV1WqiDpngFs51IWgBrkNVEr7t4b
	Hv3Uz8sWeNO/cx0tg6nrsr8t4r168maE51KorCM7bASIS4VqhPlJkEWUHnHlkDI7GwVsQ4KQ6VH
	JdiXYmMA/P3VtDZ9dRVUFfc02uwI1r2l8jOzyA4qrAj3cLMpYBnGu74lQZguqHU9272oMlvWtGG
	LwsyjRRDGm5YJX1z3a8+LDjXnnE3g==
X-Received: by 2002:a17:90b:2b4b:b0:398:9beb:5c18 with SMTP id 98e67ed59e1d1-3989beb635dmr9461333a91.19.1788008707122;
        Sat, 29 Aug 2026 06:05:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:54de:b26f:8c97:cc89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0de4de3sm21300993c88.12.2026.08.29.06.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 06:05:05 -0700 (PDT)
Date: Sat, 29 Aug 2026 06:05:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: st-keyscan - disable interrupt while clock is
 gated
Message-ID: <apLYTMtNqMQPWC8g@google.com>
References: <apK-PZ5c97mCxBSC@google.com>
 <20260829112721.3F46C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829112721.3F46C1F000E9@smtp.kernel.org>

On Sat, Aug 29, 2026 at 11:27:20AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [Medium] Removing the hardware stop sequence in probe() fails to clear the hardware state left by the bootloader. If the bootloader left the keypad active and asserting an interrupt, this state persists, leading to immediate spurious wakeups that permanently prevent system sleep when the device is configured as a wakeup source.

We should expect the bootloader behave reasonably. The default stat upon
reset is disabled.

Thanks.

-- 
Dmitry
