Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793851540;
	b=UCo1giTFbxvTTba5wlUHRsX2G+Knl/xktQFkPNJo401fef00uwhycb3CspnSO0oviemU
	 FfR6GjtNW7k/u/WNZzXZNe22BiJJ6zuDqWKN60PmplQUeMJnFgR1ChOUIbooG+wNbWtvm
	 HTcKn46ohXMTB/YiWp7ZGHz+UzNurr2UOTNG2A6LJMnex8r7F2/Qs5aKAeDaOw6ZTV4dx
	 ikMAGcVMh13m9STEWr8N8POBOcbWF87Apu3ODslEFWFfe1EmikzYilQAXoVmEOOeE9P90
	 LPYQ4vxnlYmIek6Nw/oIyBv2Ldm5+qComi0VXQdksuJbjARylY52J2Xx9UNUnwHDOlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=fGRZAFWMKVrIznwSD73OSOgAUilAW1lJLlhpS4NkI0o=;
	b=eMFGP6jhcAhSgKrVKILlNsjv5jLMIHaKcs1ltmfCUE2XLnuHA3gDs+kQRslykqhxWy72
	 yf/TTe6CZmY0n8urnBs6KBYzitMjV3WFdRG6ySVGpEXXCQwDvaWiqMfdHvaOARiVjgfVx
	 B+icV7XwZ0yNjE4A6FLBQOt0xSf0XmyxIVu6BPc3UzSDoNvYSfKSBvL/GVr5YgO+skuBg
	 bhOxpDMXaLlEsGL0RrO8rrZI3+OFEhLojB8uGau7wzkcjRdiMePWGRjf9yGiIGjxuo/wh
	 ToJp6AgpsA5E10tzoZrsCEAFbDbzElXRm9xSNbM50Dbjgv4UL1zzKS9Nd8oYxSisZKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FA58CF3t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A5A606A328
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 04:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8A5A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FA58CF3t
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ad47c246f8so118023a91.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 20:05:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793851539; cv=none;
        d=google.com; s=arc-20260327;
        b=SxjZ+REaRKLxdn41TJRmLPGCVvYH6gHUmsyIQZrboHVOCMYOoNIU5wFtTvNBJsRJUx
         ADF4HInM6sx2hkxifvdjUTC9sZsJUOFOdytL7/0hNwvAztptQZaNaPfNZgI+I1wnBTWb
         vOT0J5Y98pJcaoK01CeCzFBWrtbGGYsy0R4BPwqA5TI+vukR13WZJc2Z6+XSuN0CSJrA
         /mo7s5DTyOyJbXL1YUy9XU9OWRILHlDMRu2iypT83pFZcXI/JlCXImvAJ4OGaOOomeeK
         jD9f6fnrOafpFfjOsAULuzsxSGtmWwnFVEVcoagHqXwjkTJDLhuPp025EsDJ0mOKZMV8
         v2AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fGRZAFWMKVrIznwSD73OSOgAUilAW1lJLlhpS4NkI0o=;
        fh=Je+XfjZZELYMeUFG782y9M4oZFPTVtwBgMoamcbwTg0=;
        b=Dm20JjJjmLnR5UkSclTLnKm6XMVy77hXXS/ufLJSMR65Erk/Wsmqtj2dg0cu/Z2fEi
         kkXnugLBC86/Axn6V0EAGHlv+aJ9nmxLduZR15y3FmY157M/TE3U90nG1mgsSLZPLtmH
         jKhX0uxxSA/vJl09K10dLi5O48/oaJ6pGz85PwBY4X3KwwkqjKiytXpwa9p+W1Ex4hkG
         GBsM/I5uLnTZW5iTpWiZMqe5eagzyuLSnvlawJZT09DtVHK7bb5cuM2fqtvFMnYEKNO+
         VfB/VpV0ndu85dOg5XD44oiPglJluQDgQ5oKY4FRzUqoAC7RvbPQ1TbdHW69Pc6uM5U1
         /nRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793851539; x=1794456339; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGRZAFWMKVrIznwSD73OSOgAUilAW1lJLlhpS4NkI0o=;
        b=FA58CF3tCLEcto3mrovboB/eGFnRHJKVdOFU0wbRGOrpeIqIaPw3tw7krUyepBBlZJ
         Yngza0WXYw6VxOhEdiSC/n1kdror9BSK0uYAatNUACygBEFTcVxA0ijUGCavcBspemT7
         w9R7zqw2YW9u+jmRTbE3I+JTCFjxyos1NPYc8/IJWNfNjvDEvxnhIxY6UTNjKf80XWGp
         R5YXI0LJyHoBJTD4I22nm3/hZJBOGqjx5n5hMVgMjHjZc4BiLkKY66y2xtqCegplUcI4
         2Fdrhs9pMMcsnvvkTYUmwB1JX80E1GlXmOspdHicDhIyJdHO69I+vezAPhvXKduUopSA
         5R6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793851539; x=1794456339;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fGRZAFWMKVrIznwSD73OSOgAUilAW1lJLlhpS4NkI0o=;
        b=kZZZxq208jnmv9ND+Tkmr0UfBGq398Zix30GMpinXQCy+y/3ExaggA0jsIlDPuMNE1
         DwUXPY+LmPrmjabEUkBqEp2EHPdKjNvd29aKLsHFMUO48CEOzW4u9kOwiaiSYZsQbmXL
         48OMj3WaQhDV3+nYzNHoXbiw+FwNefQjxf/kktzD6fz65jVugRP1KA/Ptte0X1bnKr3A
         d7+kij9lY3PZb79roPQX+ND9mk46qww55ocNE+QMjXQHQjsjGCiVm7O4vHqnPCUth4Q5
         t6moKgdXryp7sbMzpod0ySWoeeB8Zh/72LYO0TvSKSVy4u8c4/LVoVEJEnGD3wmnNZaZ
         6z+A==
X-Gm-Message-State: APuU4Z+/4RKr5RmAxnZdUpx21wOyKcdbsfWh7XwGfk480U9KYDE57NoX
	yVVotiVOE/mSw4Xh3o/JnpvajirFseB7IVWZLMrjs/Zt2JI+WNy791WHfdABwyoLYmNPoCnB+4C
	Y0Ob2g9jq+XNJF2LY9UvNcZawu9KDOICRHyJWgCk=
X-Gm-Gg: AYBFou21jyiNlH6JV0WF9OKe6pK/mKRWze37dsw50YdXjXJy98zx87AL2OTP1bzc5BX
	kqO2h7RM1ua2QDox//4sHTBo6z4CzhlltOZfIFHjFF+8py3AltoBf08F1U6tZIfhjBr5+RVpnM5
	LDMgVUjS/gnMdPf2DI8VDs9011DWo9pcR2XbSZE2Z8eZ4ZCESard6iC7+h9azKJQDAUGZ85HKLX
	FYVFX+0wwLigvEpDLQzRsE+GHLpV5GIe4W7ATMFWhGhlJdIFuK+H7+7BtHo7k9jYLq9m4bRvjVk
	qQ82oO2X6keI56hoxW42SI+3btDVg8PhFfjAOuuIHwZJiHGTyUYaZiDeHwmxLaIMRTDM9gI4CIE
	KoiqsiacWlWX6/8yl/hhrixy+dCcoFSByfl1aQnKPkzFAvCTLNJrwtwU9Ygc=
X-Received: by 2002:a17:90b:1dc9:b0:3ac:9e76:aa96 with SMTP id
 98e67ed59e1d1-3ae897c3585mr25695647a91.3.1793851539122; Wed, 04 Nov 2026
 20:05:39 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104181753.1245369-1-lui2012qwq@gmail.com> <sashiko-outbox-197839@kernel.org>
In-Reply-To: <sashiko-outbox-197839@kernel.org>
From: Chengyu Liu <lui2012qwq@gmail.com>
Date: Thu, 5 Nov 2026 12:05:23 +0800
X-Gm-Features: AclHuK9jTbGmY6RMla1XLvLZjatA55u_1AU1gi1NP4ZRIt_yZ2BwifYBqZ6Oswk
Message-ID: <CAE=Q7=4WboBbXH_GAHTm29sUo9zSNs=caSZ4semRfrBRHucamw@mail.gmail.com>
Subject: Re: [PATCH v2] RDMA/ipoib: disable the AH reaper work for good on teardown
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 05, 2026, sashiko-bot@kernel.org wrote:
> [High] RDMA/ipoib: disable_delayed_work_sync() permanently kills
> ah_reap_task on stop

Correct, and I verified it in the source before respinning:
ipoib_stop_ah_reaper() also runs on ndo_stop and on the stop/open cycle
of a heavy flush (__ipoib_ib_dev_flush), so a disabled ah_reap_task
makes ipoib_start_ah_reaper()'s queue_delayed_work() silently fail on
reopen and dead_ahs is never reaped again.

v3 goes back to cancel_delayed_work_sync(): it swallows a racing re-arm
while the stop is in flight (the disable window inside
__cancel_work_sync()), then re-enables the work on the way out.  The
original race stays fixed, and restarts keep working.

pw-bot: cr

Chengyu
