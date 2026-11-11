Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423447;
	b=LZ2a2UbfdSkL1uh1mw44otG5zU7ya8r3XI+ue2M3wx4DcAzJIqOF51j1RG3xb6u3SgtH
	 ZxcVsfnZ+ATuLiYxdO3b+tR+noDSemNIcrS/PC3IDmjuqeDbV89CpkqNsqCaEMMb34vZm
	 ObCVeCsn0MI3mpinJNMc4pL0zAju8yH5KQ7YJrmZyAwvA2qNBUXb4ZSeM4c2K1Ii6Ggy5
	 Q5NSn5Qbvy0Kxzr1fSruz+fca6dcJrJW22ltiGohDGh+5noSXKdPECqqUqvnN56FxyxqH
	 qkAFbMjoPpeFAQnPtpUEVc3fsVtixv8yQmyKHjiJ63XBUMgQ+9MKtKhFy+canLxvgsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:Message-ID:From:
	 To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Content-Disposition;
	bh=x5kazdw9pUpWwrvAjh6CexZLT/5KSVUjeRcT+ok0+pI=;
	b=fmfVIYmoKskeDm5oWpYkuUBVdhSqZeG5UlRM/eOwQSNSJtOpvO2YXdfypbXkqEiCNw7i
	 zVmACOChsHsjatymHYME9PvCUEHza6gCRa8t4ryR98gzRf0QOAu2ZG3IjiZvlAvtjT/Sn
	 DfT9cfWeJZfOQ00GZGuwXbh2ItRKp4utoCBtDMPljeQRVVXVsUaDOmFsXqekANtxGW9ZS
	 j/hERCVFZJe31iHT6n63NkTaJ4NCFesJjW3OEfvPPTGENpKoc9vx8q+VZhhrXtxo2Ih8h
	 CQMCSf62TVEKqwf8gErMiyWBg2KTaN7qehmgs4VBPNgnpN5PuIWRAyWzpxjog018ilg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b3I/3RlJ";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A407E606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 18:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A407E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b3I/3RlJ
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3704d30b84fso4431265eec.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 10:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423446; x=1795028246; darn=lists.linux.dev;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5kazdw9pUpWwrvAjh6CexZLT/5KSVUjeRcT+ok0+pI=;
        b=b3I/3RlJnxVw3aQq9vBthqWlXsRHIH03Mjs4hrwUCjBen7jOL1c8P4NK+hyZnIV9ca
         hraanoaG5XDFw518I+6by8siS+hYj6v880UV78sVhRx11MsrPleiPsR9+qdw6Np3DUFD
         63hrJWq3+mBjGLi+sjzA61M4ciRzB9JU/o0gTNX2tyCLRTemQNUiPNq3MCKwm9pkMrcc
         ITd5KT+VVjRSfGAru1xBNca3JK7HdZBneUlQuIhduHG5si8ws2zaP9l8sUYQM3velEZ3
         Nj5eKt8j88AaAGT1WTpgegAdzrPvxBu4SMRhBKf7SEpNqaU2eZ3DkDomm+Rcgzmy5wyn
         9P9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423446; x=1795028246;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x5kazdw9pUpWwrvAjh6CexZLT/5KSVUjeRcT+ok0+pI=;
        b=AYmbuJP2xPwQC5jMmAVhi/oHwYchqUh5kVZ/tgMJPdAPAWwtnglB/i9ET5nooyMD6+
         jV0OKdYH97DHoaMODXIzCpn4XsewB54Vi7Bhg4EQpKm8w1gzIRHNrVMLDqV+scCZV3Q8
         vPRzNQAZmh6AksgmkHgGdfwqaZixQFFrsItG/4EaZyRHlzR+pmL0YbFQcyPfvuiv4lmL
         f8SuS/KiIe8vTI1XKWvHuQvZWJ3BnhisqxODLU/rHVAxLXFCe9fyMLT52NOJMN+MpvXd
         d2wXBlwZ8vJN+CrRnpx6HCilUYLWlnYerthQHn2WNPVu/TlUq4AOLOQfWxA1b+lHQg/J
         2dSg==
X-Gm-Message-State: APuU4Z/PjAHcM/1f1EuHWQSbGyJJRdNvFYjRLE3vRnGYpwKtElaRaiKS
	Wj+RzcoPsvwauSSNW8eJ0m3Jeovq8P8EcSxBtVlWZnk4CMvXJqhB5enlnx/hJw==
X-Gm-Gg: AYBFou0igHvjbcPONPSgoIl6ATn6usUmSUisidVHkPXIg6n8JeZXqaV8AGFwOIyPoGd
	4+w1jjTNd9ksZjbDsBlCoeLza6sCXQYs5pjC83VRfcxntZjjiLIIx86Km1iNu418HFpR9eFK5KK
	nRCAZbXew08VMs/SK1dnheY5++wLCaIFd3zgLgJ+R/vv3TRWzkbx1wdwyldDnHYWcb0jPGGSlmZ
	83SSi1QIv/S+tkKQLqMGuwdQWwxuN7ZqAlI44ywPegcYLkdRs0v6Joc++Ad3+Fw+kBmOtHZ+FJ0
	UgolTbHFiN2nArhHm4+BNhkorLu1RCe3huw8Zd9u3LPjnuCy6iNshxJXR6U9hRKyE52h66DLh+Z
	SNAJLEvX/znoYGRGiy+Szofr6uKuGY/TnnX0+F6Y2Wgk4BAdzAbkTp5CZxaMeDA5mr4Z/oK7suC
	0ycuX8pAw7xziHLiMGtqA+KrXIw5wfxPuU1B0tOLFM1f4fg5Lz5on6hn7fJtvf1RRGxw2p3KjcM
	srHxjIrpw834hYAJcZi+BoE/+wB5ydLtNqdDtaxkO0p2r3niJou/HL+Hn+jcm4wvu0O2VXKNgVE
	LNnF6glo86b4YgWFYVL09PqAucAJl5FJWsGXUhJy0EReDmrrAaNH9mozKl4DxIYRUs62Ow==
X-Received: by 2002:a05:693c:88d1:20b0:36a:3ac:b15 with SMTP id 5a478bee46e88-37686d34463mr3531908eec.36.1794423445666;
        Wed, 11 Nov 2026 10:57:25 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm17646491eec.12.2026.11.11.10.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:57:24 -0800 (PST)
Date: Wed, 11 Nov 2026 10:57:24 -0800
Message-ID: <881603869168da758913733db4391b6a@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v2 14/33] HID: logitech-hidpp: expose charge_type property for battery voltage feature
In-Reply-To: <sashiko-outbox-208625@kernel.org>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com> <20261110-hid-logitech-hidpp-v2-14-30743e91d83b@gmail.com> <sashiko-outbox-208625@kernel.org>
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

On Wed, Nov 11, 2026 at 08:39:27AM +0000, sashiko-reviews@lists.linux.dev wrote:
> [Severity: Medium]
> Does exposing POWER_SUPPLY_PROP_CHARGE_TYPE here cause sysfs to report an
> active charging rate even when the device is unplugged and discharging?
>
> hidpp20_battery_map_status_voltage() unconditionally sets *charge_type to
> POWER_SUPPLY_CHARGE_TYPE_STANDARD (or FAST / TRICKLE if bits 3 or 4 are
> set) regardless of whether external power (flags & 0x80) is present or
> status is POWER_SUPPLY_STATUS_CHARGING:
>
> drivers/hid/hid-logitech-hidpp.c:hidpp20_battery_map_status_voltage() {
>     ...
> 	} else
> 		status = POWER_SUPPLY_STATUS_DISCHARGING;
>
> 	*charge_type = POWER_SUPPLY_CHARGE_TYPE_STANDARD;
> 	if (test_bit(3, &flags)) {
> 		*charge_type = POWER_SUPPLY_CHARGE_TYPE_FAST;
> 	}
> 	if (test_bit(4, &flags)) {
> 		*charge_type = POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
> 	}
>     ...
> }
>
> When a device operates wirelessly on battery power, is full, or is not
> charging, reading charge_type from sysfs returns Standard (or Fast/Trickle)
> instead of N/A (POWER_SUPPLY_CHARGE_TYPE_NONE).  Also, when a wireless
> device disconnects, hidpp_connect_event() resets online, status, and level
> to unknown, but leaves hidpp->battery.charge_type at its previous active
> value instead of POWER_SUPPLY_CHARGE_TYPE_UNKNOWN.

Agreed. I will update hidpp20_battery_map_status_voltage() in v3 so that
charge_type is only set to FAST, TRICKLE, or STANDARD when status is
POWER_SUPPLY_STATUS_CHARGING, defaults to POWER_SUPPLY_CHARGE_TYPE_NONE
when discharging, full, or not charging, and is set to
POWER_SUPPLY_CHARGE_TYPE_UNKNOWN on unknown status or wireless
disconnect.

Thanks.

-- 
Dmitry
