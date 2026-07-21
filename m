Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3787261A
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 09:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625364; cv=pass; b=PAESBNJT6EErvuEUU7NBanK/KlrSY99tRrkdjboBY4XCPcE33pbogzvppsthupedvqs2RbpH8WEDLyEiYt4eXg+SMJwgY97MelnEzt11qppjoJU2W2kT5WmQa+WBX85/aefwBZi83B0ozqB8rUo9SxZnAFU/4cRJwxmB4zbs02s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625364; c=relaxed/simple;
	bh=iSLi3M2D4DLUvmeXcdgZGaw2pMxFSQcGo+2BrU6o8ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XTh4efHkInVanhJul8Kt2q4563eV584GG8I4rHbDv1ncvLHaL7Fifm+YgS5UBt+wSdtEfxnn0exJQ5aAqGhgNtEgFrRzqQSW9CBmWY9TarZbFALEuCiFz/L5X5LZA9hMHEGVkhzEH/ap9n2fY+JBQWqdDuS93vcQggKC/RRj9xU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVNIyGid; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVNIyGid"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c197f968b3cso265062066b.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 02:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784625361; cv=none;
        d=google.com; s=arc-20260327;
        b=TLfP55WISbvgX+1yH2Xi/848eXPvXavxCRthDFCZD5DjuxkJbwF7S/9rzUijOEK5IU
         YyWRPl24TgP1EhfFu7SrtYivqVZwVV7Zh6UgjP/wmZWlF8fp5klewShS13TEdtwhDsCk
         2/LxGlcecuieuQ2O/3LWrZ4SrsyPn/InVrHKrKbtQKIzH62ALINx1Eq5okNBeje6s2ZI
         DlTkcIJ+twu45fI6SUXiYVzhpANy2gPHCPQ9JEWoNs2vyHKbxpNjx+avGc0w98Z/fcA5
         4PTly0yxuq5acv/MfsjB5bv2kXsvpZ+fmEoWECBqNNhfPxo5c/oLeDZKXJoNXswcYIjC
         wGRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iSLi3M2D4DLUvmeXcdgZGaw2pMxFSQcGo+2BrU6o8ms=;
        fh=vz3pN3PK/bu+NRXdfIvIk2p5+cHuimYs4qHOOK8kDks=;
        b=DDqoHmeRV0zedSzpvG1B9xvUfSENU7K2rhv3RVkL+E7tqGwK89vf3mk1sNYKTdO29P
         HWGb3sXaKBRwmbZcIC7LSye012zUlcm+fKiuAefK6NSQOFZ86alTI9SVpub6veUEvRCA
         IXOhekL7epLmntsl844SGqB/juDD1B0VdBMq3c/GFazW7MzToDCbtkF6K74pQnCHhuwW
         5wLcxPQwLw4hWAQvzrfglRK4tVyZ0UAHsAFbGYqKqweqSZSZ1j7/PCNdxozF9A3LjaWD
         64s2OaDqG1jRJ27KoS/rDKvu89/TjdHED24uioPcjmj6oKoHPiG+fLyqj7q153R1Z0VR
         iUnQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784625361; x=1785230161; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iSLi3M2D4DLUvmeXcdgZGaw2pMxFSQcGo+2BrU6o8ms=;
        b=lVNIyGid8mony2sB6wXszx9nKlsU2VEwdirsVWyy8eFXLZNeWvQoRy+DjT7LRQoK+p
         /M7M2WVoUY4dqb7g+/z3v7V+SoO9oXH+84Wx27GADcSt+BcrHdxQCowRO037SR9e1ZXt
         GfBKC+POR0ocGOpANZI06/lkMrLYygJ2PErX5LMylcTS6hjjXM8Wv6pfS8rYdNHJQVB7
         +3BYj4TqWZHVlQaCZVkVI61XT5gdXUu+e0OldNROQDS/I866xUNqq6Zwwm3F5RCxFn5G
         AbbCmDLt+AlgiA3Vyd1teAKXw0nnjk650OXIy8sk7bb94Kp+iWUrD6KNZNIJ7ZJZ8dPu
         IDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784625361; x=1785230161;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iSLi3M2D4DLUvmeXcdgZGaw2pMxFSQcGo+2BrU6o8ms=;
        b=pEOmeZ95azYKJw5BDwAxjg8fwcdr54VG23gMQNXpA1QS44KhI2PD6BqE7J5Fz7H6kF
         /YkpmfXYs+Yd/Xw4uJoxM/GA7kD2D80Wno/8Z5T7B+uRTXIZ3UdyVXfSZ7UpuAwmqTsN
         NFH6l3I3gZ8Civ2+vEeycj9GP9ktL7zXj5pSqgl8yKFdWvg+NFY4V9MpXsGJ2HhajZlR
         lAtXdBfzmORAPlMmKmiZuPyMlhXCANKu9m/WMJ/dDOYCMLRwj7GTVFjlEUZ+FnbUhtKF
         PewEUVYvAmO1HJ4uSnjyuu/J0MTxWTm9zw0XhmEKzawU1kXkwdSzqtt45PY+Rxo+MDzK
         d47w==
X-Gm-Message-State: AOJu0Yy0+6VeO9kSsJaRcUq1BR7XlcRuJROzUkzJra9T4eVp5gHrpH/J
	hjA7m6uEQrv4Gp2SGKgBbwth2KxF5rnI33N9nFvtabryItn6J6a+yoQMmHS0XNPs6GP1qFfBrvJ
	9iKH+g/f4fr9SrUJXPXIR/TzT4u5NXPsL5w==
X-Gm-Gg: AfdE7cl6CBVZIds5bTbdT6RVKm5+p5tzZ2MxRAtqfx+JQzQAS+14SIR2mGXQhp/ZiAD
	4eG5cbh1ldm4P2XqYHjDZ9S42rLliuHRQ88mA0eXiysRFjFCbIGgG9SQRM+djB4HKArcmKCMvY5
	WUsXaEI+3/R8JDnIO8URrgkGBy0s71sMStpHuiDdVBxCjeEutdjwRZfH7G96zRaEBOaftkR0DQ/
	/2QiCTFuYA+GqA2Ejn7n7+izNKRUTXHmH+/AXp3MCkIEcyVm8u/Td/JRLgoQhM=
X-Received: by 2002:a17:907:e1d3:10b0:c12:34ed:da14 with SMTP id
 a640c23a62f3a-c16b47ea252mr429571066b.64.1784625361195; Tue, 21 Jul 2026
 02:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716173325.653164-1-a.shimko.dev@gmail.com>
 <20260716173325.653164-2-a.shimko.dev@gmail.com> <20260717173343.BAB8F1F000E9@smtp.kernel.org>
In-Reply-To: <20260717173343.BAB8F1F000E9@smtp.kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 21 Jul 2026 12:15:50 +0300
X-Gm-Features: AUfX_mwuJCnsoV7Bc__nij6gLoEyjQsRRd1cfk9xj0N1tsxo1IN6pUGHjkJVOHU
Message-ID: <CAOPX747iV9HbeLERSWFxMU9wHdyv2-ftS1PVSYhYF8HO7cOKbw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/2] dt-bindings: net: add DAPU Telecom
 DAP8211R(I) PHY binding
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 17, 2026 at 8:33=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> [Severity: Low]
> Is the dapu vendor prefix registered in vendor-prefixes.yaml?
Got it, I'll fix it.
--
Best Regards,
Artem
