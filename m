Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423442;
	b=zjprSNXOKNYOOozoy9DOcjlJoNtOAVi+VqPfCUG0FrskQL0fOO0LyC0JhZfOTOP85hoL
	 RxTkoTFRSy4XvoezPxjBgfGjYkBOd8879pU+IoPejD1iJRZ0IFDtFxv04XqF4zaZdMHDL
	 uE5N8RAUfbPMCdB7ajO1fLn4+GOCd9CsBQ55oAZz/fdE6i0ixFdgKtDjzuBoi+14GSXEI
	 2N/AQCZ7IgFV9d2uygNU2hqf5Ocx+ShA6zz45viTpdMfFXwiPJySB2W7yIV3DG92uxsPa
	 51P5ev1CRqb1jR9vtWWt9ZN4OLg1c3ZK/GlBmktaN/zEIK0Uv6RlaWYJnsZqPivezeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:Message-ID:From:
	 To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Content-Disposition;
	bh=wtJszn8+3NsUlzqSLIs8TPLmW4IzbruAZxBfG0QVUns=;
	b=0R07TAKj1yOpmWP/FwSEhdnffDfP6eYob7dIp2ZwcB0ceGlM9mEQzGMbza/CYA/6VekO
	 GYwwL9kHJnSnIWmh2lkmrJhbszW6EhmZX8YVNSSgkMNdFbzaRClDr67qHDdSs/tYtI6Hu
	 17yH8m3oQxpimsBFU8Hz4KVI+pdPC9kpi3UEjhvELH0xHQlv3RERe8ZJDwUTySNs6hWgD
	 zJBlzSFJQD/Rtsrpto/8YtKgvRiGexQ3CSfGLF9mqpKSTgCoPIbWHTDRTjmItaOLnTS0B
	 CMg8L4fC+aDT3jBW6siDHarVyoeYhJ7LerPJyV4MzKL4c+9DuBvWD5GkFfZls2xUeEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AUeHMp/S";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8B5606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 18:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE8B5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AUeHMp/S
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-372bdb942dbso4465396eec.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 10:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423441; x=1795028241; darn=lists.linux.dev;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wtJszn8+3NsUlzqSLIs8TPLmW4IzbruAZxBfG0QVUns=;
        b=AUeHMp/SWKUJj8/rVf1uPNNNp3b/ZBYu5kiHsp4V/A7urukUESakkLFiP/usOKfgqv
         61HKJ3mLhczxF5sjHqCL7JWEtJLwQuT7cuQu3f6tPLA1OHMHTkQV/hHAUBFkNGuaocG/
         eGJcyPYClX5jsq7LfuK0ZRZHXb9Z802NG+xq7aigdnTnZjXJx9bNA4YTubHhXIkFLVaG
         1rjfD3EDJOFl4+FR7o8QgqSZmZd3KIpv98wDYGga1sJokaFpqz/u53dR+Tjurcmn4UG3
         YvqAd/GwsDGNXArNDs0VLJYRaJQLXHKIfk4D9ARr1pe+7/Pplic/SF/s004E9Ajugxw2
         Ugpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423441; x=1795028241;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wtJszn8+3NsUlzqSLIs8TPLmW4IzbruAZxBfG0QVUns=;
        b=LjjBY1NOzzyR2t0XiDXyocOVxp2P4X/7+n3ETLxt8v9fEkgxZ3102qAQHtMjIIs8Vn
         0ddoNftdFy5aYJjtDNuv7cQ8TMCByn+uJTuCIrKJEWKrLGKuEXStACBWvSZm5Q0wnWDv
         tZd0EpI9v93VsINfTZrRlEnjGOX0lsdFGjM9H5v3J1e1uiFIaAdOi0q4TY+C9k3cKFXp
         u2SOVPY71hP0OOOVEusC98TvXHxy1BcDvD2PeOq6lhxdwctsN8OPGb0lhUp3S2Estdfn
         sO79BKOnZ/nxOk/qYckg5NkXnLPObrIKl3p192tiPrTQfOgFG3+5u2voj5EbhlOBzZHp
         svmA==
X-Gm-Message-State: APuU4Z/GALZq+lOcltWlXf4ZuBItC2PHqS2ShVurxma8ULDNWsmDfUHd
	g4qMcr7+0j3FGeyL/TuiZfWaiB3SYLrAqdsIELn+ABIJAjIpf17gJQjFm+BNag==
X-Gm-Gg: AYBFou1qhbq5ul3+/2mGoRmwF+kNo+2CWvzlvthKKX/ia9TsjkfNPuu0OkpYSnXeD7w
	g01764jG9qDXDvVhBGoajlvI13mqnRJzcYCCAgCQ//WX//jFInu4fugAhX1Hhhhv6gbm3jFXVvK
	csvWhWmn6piK/qJyky1pdXsjiFYOVSkiiGE1Rc1Og1uwfk+mt2iPHitVr+mQdPK+6+hDwUzrWE0
	E2xI1V5awGn3aDBfnN4hgIKETPhkA1sw2dSshj5cC9zJa4/i+vtmcIQ/dX75FM1IJkGpBzEIGxK
	xuBZdWC+FehQ2aahSma+/CEdH9K5nf1yKSbxZzqkl0I9t2GaGcDBcMQFjTvkalFOJyf+SuS66HJ
	J0wHYqG/BHJn+8G4YOr+my5C19ZYmNyGpgMfU4hEcKCZDhGOEafXsaOLZl10/ZJN2VhMwATL6K3
	aPgThwvdq0tfib9mCaEeNv/wm8as73EetCa0Qib5GiRSKzrMEbNeHzzaWDMCam16XS67KntMD5i
	iMWAc97Pw6CQTuRnA8m/QSlTmthc82AByIcNjjthq/bUH38f63sZtL+a/6dIiTp6G/93S1hHVPN
	JSS+TVwDq+crfEakHy8xLRBw+7RO2h2MA3WpTYTVudGo1ostavPgjBPUnUQSLWHbDmbf5Uw=
X-Received: by 2002:a05:693c:8854:b0:376:c352:2fcb with SMTP id 5a478bee46e88-376c36186d5mr2599586eec.9.1794423440516;
        Wed, 11 Nov 2026 10:57:20 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm17645762eec.12.2026.11.11.10.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:57:19 -0800 (PST)
Date: Wed, 11 Nov 2026 10:57:18 -0800
Message-ID: <599a0d10a56740c40c801facee37652d@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v2 12/33] HID: logitech-hidpp: mark device online on unified battery 0x1004 events
In-Reply-To: <sashiko-outbox-208598@kernel.org>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com> <20261110-hid-logitech-hidpp-v2-12-30743e91d83b@gmail.com> <sashiko-outbox-208598@kernel.org>
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

On Wed, Nov 11, 2026 at 08:22:48AM +0000, sashiko-reviews@lists.linux.dev wrote:
> [Severity: High]
> Does this cause a regression on feature 0x1000 devices by overwriting
> hidpp->battery when a charging event arrives, and corrupt 0x1004 events by
> running hidpp20_battery_event_1000() first?
>
> Both feature 0x1000 and feature 0x1004 store their index in
> hidpp->battery.feature_index and use event ID 0x00, and
> hidpp_raw_hidpp_event() calls both handlers unconditionally:
>
> drivers/hid/hid-logitech-hidpp.c:hidpp_raw_hidpp_event() {
> 	...
> 	if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_BATTERY) {
> 		ret = hidpp20_battery_event_1000(hidpp, data, size);
> 		if (ret != 0)
> 			return ret;
> 		ret = hidpp20_battery_event_1004(hidpp, data, size);
> 		if (ret != 0)
> 			return ret;
> 	...
> }
>
> On a 0x1000 device, a charging report sets hidpp->battery.online to false
> in hidpp20_battery_event_1000() and returns 0.  With this change,
> hidpp20_battery_event_1004() then sees !hidpp->battery.online, forces
> changed to true, sets hidpp->battery.online back to true, and overwrites
> capacity, status, and level using 0x1004 decoding, which also prevents the
> 0 to 1 online transition needed to schedule reset_hi_res_work when the
> charging cable is unplugged.
>
> Conversely, on a 0x1004 device, hidpp20_battery_event_1000() runs first on
> every 0x1004 event and mutates hidpp->battery.online before
> hidpp20_battery_event_1004() checks !hidpp->battery.online, setting online
> to false on every charging event and true on discharging or full reconnect
> events.
>
> Gating hidpp20_battery_event_1000() and hidpp20_battery_event_1004() on
> HIDPP_CAPABILITY_UNIFIED_BATTERY would avoid both handlers matching the
> same event.

Good catch! Since both features share hidpp->battery.feature_index and
event ID 0x00, calling both handlers unconditionally causes them to
collide. I will update v3 to gate hidpp20_battery_event_1004() and
hidpp20_battery_event_1000() on HIDPP_CAPABILITY_UNIFIED_BATTERY in
hidpp_raw_hidpp_event(), matching hidpp_connect_event().

Thanks.

-- 
Dmitry
