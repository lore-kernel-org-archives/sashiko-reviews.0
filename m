Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423452;
	b=Zv7HgbU9Q1eTbGK+9cSqM4g/eUvDIJfhl/3lSi1WDBaAiwKYo8GaPxedjb3pj4SDxsbw
	 RUtpU2JuUIr1cjvd8Cnxp7fLddUzf5nqg1XfBtJ29kJgzFgc8itQXAfAwTACAF+jfocpu
	 XrlixE6fAYTumq/if2/OtfxSyHMRbQObjsELrAdqedGVp32a3ceem4uTqUko4Qh0nkTCn
	 UpJIb9TTvhN+Wn9uFzvhk7d7scYxw3dRHwT/BiSFby1/VcekuKo/DG7WsRMWqOnTFtpzE
	 PsA0/wkuYqj4pZH6l6yDERWoWEFjOShEVNpD1TVDMiVu163rHJKiW/QASdUdemPCD6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:Message-ID:From:
	 To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Content-Disposition;
	bh=PvpWB91aPTgwry8ewGxxPpJ/Tnw5Kh2x9Pevtsk6tvc=;
	b=oYJ9Q7S5937m1umAm+sbVVaAJkNaZ8/DbGTBwgdiXKRRIPwP0rrto/mnAtWgLrb3Q6ot
	 UdEr9IRMaE3iu4IzPmpsLN8l/ODL0TIQFGee99KDdObIA330LWGde9KAvKHlqZ1eCjDOK
	 qsCCvWo3O+nBui+wjYLyeO7KOAm9vnLM3W7As4sXoJmPXtKPuf++hSg2uUaAn5bKgU6Ng
	 OnsCpy6Sbc5Ht9I9shmsaoIcS9X6mbl39KmvS0agZwesP+LOlqZKXTDWH6hru4kLFZCuK
	 uHgvtCRooVIGpTG0O8k8rOgY/tYBdjDcKu/EHA9hsOaTl3ibW2zYJVY5T8+XHM6ARhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xi8678gD;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1263606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 18:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1263606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xi8678gD
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a2af4c8d00so3270133c88.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 10:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423451; x=1795028251; darn=lists.linux.dev;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PvpWB91aPTgwry8ewGxxPpJ/Tnw5Kh2x9Pevtsk6tvc=;
        b=Xi8678gDkuhX+8g/EvCRYe0oarcdqAjxtcVzYH8egUVOMSB9dK1TuwINq2gN/nl0nE
         pMtnEzzfN/OsGvBN3f4QNlWuQPm/j3YIoA88A+/3v9k0qndGbSaCAAKerVpxJrD+Y2TC
         eE6Bl3WMQg1/S6gqKuF6X9Y9WPIVZcAba1GvtHQCCIm0RcRAzUrgv1sHurFaCq/e4sKl
         Pmreh91ncH+r04HUIFd1GQmDaQf+eOnfbqt+Bjt/FJAf1QumYqStQjSthQTOc5Soyc6X
         RLK1f26+/OMOLV5LNhWGfoZ2kewnFJBjFTBA0ZTvrjMMMDU2RKHysyuntYMGybjgIHvn
         ltNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423451; x=1795028251;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PvpWB91aPTgwry8ewGxxPpJ/Tnw5Kh2x9Pevtsk6tvc=;
        b=Hk0cx3IGkUv7ge5mptg7bBGV4Pn8FQaxIEzTFLAgDAKGK4adn6LDn0+dlt0cGP/8PH
         tXejxE9cVnbg6Lhd4sF9KupPXXC+9qURpYz9c1zEwailBAW7iGSx8nO8MPtwJa0f4NY5
         eeQGhetMcHOZYR4kHVPwfAWq4FdqYWOKPZZx17BvsVwAfNoX/YIBOUkQFVSszYsxZTDE
         yjY3gYqT8TrHfVLuixohCrMbnhvl6UxtFaknwGtujWGxZapGIMYWGBqWJAkLBlvFKEVP
         rGmyFYYdQ0i+Oy069SK4xPjXZ4GyTktsoppVvmRrDpxGSyARB0ICZagBS7r4lcri322x
         k1SA==
X-Gm-Message-State: APuU4Z9QwKEFLr6lk2n0wUFvuCc4fL+ah9lRBRlInDphW1C0E22+YDdA
	97L4QbfhbxOqDu5UBaBg5UZQK5Y8AeriCmnO57xY48rqP5QrbwJBeDkaJ1tzuA==
X-Gm-Gg: AYBFou3U2VKNhOFcQuAMbAQHxFyyK/KiBTVXX4TzO/ZmLdLKuvwuDCyPyUF9mnd/atT
	P8acy+pQDpjNBReerHtywSMOxM0LxGDck4CAcqkvnTCxZ3hbuRYjjC0Hk9eCvsi4sPVk7ZvmjHN
	Ftpsuu2CZU9qCIrZmPVKSfq3pVWMbQM1nUxUmi9d6hAcMz3cPD2sNlGkOOtnlrnarOzI4kcI8po
	c3kUKnCxid4EMDAxCXdVky2+DI/iumFNnXD46/yf1vHhNehwRUKctMwHCz5vDX0VrMW4RuaQQka
	6GE9+LmgxmU1uaeyKFBJFieVOPfjERABaj9RYoKLtyrxBZXNi74BbqHFwcuSdzHctY/F+mCQGDT
	JA1n8TcRA9HqbwibtFZve2BXXrk7rFQX230MnNZDJEC0DNjVOqFFrjBc4QJj/4xbMmKq6nlpLVS
	6g/4A807TTLpV3aHdauMjIeN74rEyLvaBM4ovOnjj8lwSz1d/oe4WgjXUHLFUt3w2dJD5t6zvEy
	KzTswzsYhelkBUKBEdFnuJUarCHEAyU0PSdv3H+3u9smtv7bpiU9nkEjcFUoK4wU3kjw1+bTfZf
	tzF3CCkyqyYWutshqYpKIdBQrQVzPKhNIPhVxzok7KOEru2n0Y1+lDtS6dSuQZhWycyVTw==
X-Received: by 2002:a05:7300:1ca2:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-37685896bc5mr3836499eec.20.1794423450736;
        Wed, 11 Nov 2026 10:57:30 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bfb58dsm33703047eec.18.2026.11.11.10.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:57:29 -0800 (PST)
Date: Wed, 11 Nov 2026 10:57:28 -0800
Message-ID: <496e56a7c537e04be4b946e46439e103@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v2 16/33] HID: logitech-hidpp: preserve transport error codes in __hidpp_send_report()
In-Reply-To: <sashiko-outbox-208632@kernel.org>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com> <20261110-hid-logitech-hidpp-v2-16-30743e91d83b@gmail.com> <sashiko-outbox-208632@kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Nov 11, 2026 at 08:47:14AM +0000, sashiko-reviews@lists.linux.dev wrote:
> [Severity: Low]
> Since this fixes the return value logic in __hidpp_send_report(), should
> the commit message include a Fixes tag:
>
>   Fixes: 2f31c5252910 ("HID: Introduce hidpp, a module to handle Logitech hid++ devices")

This is a preparatory cleanup for the negative error code rework in the
following patch rather than a critical or urgent standalone bug fix that
needs to be backported to stable trees, so omitting the Fixes tag here is
intentional.

Thanks.

-- 
Dmitry
