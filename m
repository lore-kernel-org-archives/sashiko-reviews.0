Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C0645FFAD
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 17:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246994; cv=none; b=RZ8wKzygQGOkWTdgn9TYRL1d3ya8c6oEIOTMxvsTS8av71fZ6MzR07f1Paw4rjMiPB+pBf9DEoj5CS2ZT3/xSZf/NLDx837F2GLk11KVGVOc3l2D6uxG9b6KYwWnWzwafJdkTMgS98Vh9smvdLdtHhgrwuoM2oTF7LsqavqLZGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246994; c=relaxed/simple;
	bh=S6fDO/OvmnpEv3y56Gcz9A5mW0qI4GbmiOBQlO6WwdI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z0oaio83U0Dz/kxbcDb4G82rZqytd9wEOsf5GnvVLbt06msb8qOSlXPjEh8x3G6q8gQROKATppuE8FNeZIQvXDEbgmZSnUvJZPmOb3+RzeKs2zVyzszV4f5TDiHNJc/OVp4VL1xulye9QkuY0ukULZ1tNMjugx0qNVGpnZIsqAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hArgYwTA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hArgYwTA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787246991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S6fDO/OvmnpEv3y56Gcz9A5mW0qI4GbmiOBQlO6WwdI=;
	b=hArgYwTAqZUOI2nbMJSJu6wHU2Wd6ELhZAnTZeCAdGYNNmVxMjVSSmnHhVOTT6xJWWyv6G
	UFv52SJn9Ipc0a7b+vXC3mwfYLrVrJJLyllf5r17cEjhzPN1OA0+9zIPAQgjxrtMhAoR/0
	3VKHS44VThhCipIOGkQhxB7EeRlU89I=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-HgQcx6iOPASeHvzGNbRg9g-1; Thu, 20 Aug 2026 13:29:50 -0400
X-MC-Unique: HgQcx6iOPASeHvzGNbRg9g-1
X-Mimecast-MFC-AGG-ID: HgQcx6iOPASeHvzGNbRg9g_1787246990
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930a098ea19so6424985a.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 10:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246990; x=1787851790;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6fDO/OvmnpEv3y56Gcz9A5mW0qI4GbmiOBQlO6WwdI=;
        b=c1JueebP7Gz8VHgjczssrntyyKCqowHZvNU8F+K54X/DHX0V8luaOryrZi/w6n0tPL
         OroZmDHCfGSHoUH/tYA2I2XAMsu2lIiUZ+4HDyO4l0xpMA9piYADXeBkxacWulgrNGQ4
         bBWNWl0qejFA8Lt1xp47AvpiKCZSYgsLTPPSXPkNBz+66D8T8IDxhzs0NUJDAACOknH/
         rpL4mmfgodp6nqhUA+L9p1yLG54zbtlLd4Q1eP4upjTs5rDUVP5wRo/TAnqgN6wNUImk
         3Kza1K1GUXAtrTxbKDMF5R2XO8O/D0nXzcOUP5XwW6atxWvnzyjg6N8zEcOeFUJi8qXl
         Iihg==
X-Gm-Message-State: AFuF++lkcyPFDyO1Es+AsCc5KKlYwz1rKc8pajqZ3Q4+2wmA1lYpYbHG
	05BE0sljR4zRY5DJ12sBjetzw7/TFyybio7G1/GmKoAJsvUuYeTjXuSqRF7AoK7QKTL51JsxHPC
	OirpOk3G9/JGnILF504zLqOYDjvEEF2+OijU5Vw4UQc4t8qwiEnX7UkSa632n7w8Kc6jWErWDgp
	lEdtMNJbAafVIX3PdXIyzBE1OdSmjBwLIXGvnGiEdJ5KEGx8+xXw==
X-Gm-Gg: AR+sD13HWmSLqVb+G2r3NYG/JaHZosde95ydgir34ve71bw2dkca7N+ByIxT44i3pOT
	MHQv0PdiI0Zo6LwVo9y7eYtUZyhkfNjiNHYg1cdaFrS4cQGz9IUsvkIRBniGpHyOE8MlRytdnqK
	HvEHeHPODNokxEl8fumSt+MXiTwr9lfGMsGrUg54q/HpseQROnfRoGx1oxjwn86U82cpaVW4O8K
	hcdrQCnwbCLrd1FIYdvc8qD9Q0OgSs1fvTEvW7hatdzLLs+tTv5nrdtdaO/FQhpRhPTeX1y83ms
	ARdHE03bMp9lEjNezkZgTEGU9F1yXu2aSZzfZQACvpZz8EekoiCd/KyXtEAMI+GQaRBbQ4Q3
X-Received: by 2002:a05:6214:e44:b0:8f2:3472:5b33 with SMTP id 6a1803df08f44-90c5eb3e8femr119832296d6.23.1787246989666;
        Thu, 20 Aug 2026 10:29:49 -0700 (PDT)
X-Received: by 2002:a05:6214:e44:b0:8f2:3472:5b33 with SMTP id 6a1803df08f44-90c5eb3e8femr119831826d6.23.1787246988873;
        Thu, 20 Aug 2026 10:29:48 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f28feffsm42491486d6.27.2026.08.20.10.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 10:29:47 -0700 (PDT)
Message-ID: <26de71ad1e7ea3a08ca30b99df49d7c29c34ed68.camel@redhat.com>
Subject: Re: [PATCH v2 5/6] drm/nouveau/kms/nv50-: Add
 nouveau_encoder->audio.crtc
From: lyude@redhat.com
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Date: Thu, 20 Aug 2026 13:29:46 -0400
In-Reply-To: <20260819161540.439931F000E9@smtp.kernel.org>
References: <20260819155934.154125-1-lyude@redhat.com>
	 <20260819155934.154125-6-lyude@redhat.com>
	 <20260819161540.439931F000E9@smtp.kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LQOQL5vllv3EYi_cEjouLwx1pjqtAhdJvWuhWc2Igzw_1787246990
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-08-19 at 16:15 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [Medium] PIOR encoders do not clear `audio.crtc` when disabled,
> leading to stale CRTC pointers, ghost ELD reporting, and missing ALSA
> unplug notifications.
> --

Another hallucination, PIORs don't support sound in nouveau - and I
confirmed there's no way with the current codepaths for audio to ever
become enabled on them.

