Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042D9394E80
	for <sashiko-reviews@lists.linux.dev>; Sat, 23 May 2026 12:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779538328; cv=pass; b=onc+Sed69+em9sCW8cAibgLuf8t8n0ndjMlHUT41a/s88ea+WFpt0G4fzCa9ir2ZHzd4PsUVJFR7nValg1+cabd3xWmfZhvPyDad5y5XmJGaA8THLU7nYrKbYIOkcvnlETnMwJFXbJhvK32e365l2Dbrlw4mlDfvDsjUIQOQM/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779538328; c=relaxed/simple;
	bh=2VtsKi4WeoXlo/h5B8OP4CG1PkMFpiBngeVHvJw83SU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=buDBKlHxAZEnRq+IbU0+NXbnDktfKm4kNr7CescN39UnH+TgqegFlQflnPs63pj0bynfhfMSePvSfMXspac5dWhBiZio4Cz0Ceq7Fj+JqSmcQJerbvsD3xqqpv39iDJfGalan+uj/l5/6zivZLfXS3lQ7iQcoukNinW76rcUKt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8MeXwzo; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8MeXwzo"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bd3eb594960so969635266b.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 23 May 2026 05:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779538325; cv=none;
        d=google.com; s=arc-20240605;
        b=gUwVJAfgOliN9P6T6VAcNslHvfTAQs2jIIZT1sm7Oe5/iflJ3LvPpxfxe/snLBomTe
         4WDoR0oX8uDi/QUp+d3i6ASH/tVGSwjZpXBGghMWZEYb3eumHQCuTpJ2c0IvtGzdWp5W
         JrDY++y0gmiwZxK3aLRinkxilE+9D3CU6oAizKeQ++BubmfdlZlc3Ao+dI0j2YY0WQaq
         2EQsJDpTlGfBG+2iZSJfqGZAjIsxu+8ZWwASunXRa0+QSSfdMdoYGR6DZMa7eDbgIz1s
         DQiQVjO4VGmJSffBR2ypdfDUNFMLO8zUYc80T/1KVvXoQoId4k0Hi6O0SPf+Pt3KPcup
         Dx5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZxKLv419Kh3ldC+z3qNJwvfzNG/QDZIqGAP5yoc8fK8=;
        fh=dfvPRi+t5KvUF1qpgNVmacxvd83mvku6fE8K+/2kbH8=;
        b=Z2ozxyPIfJ5RK22f44WE0oKVj/TjFaAaOX/QNQm/fcqNqmHHPwXlwcl9X0JKK7snxj
         gI2mxb1b2aGnkWhW96TLcU5w96JjVYN6BxA+mABajY6mWGEUVvx6+G4Q43z7whfrWzSr
         lG+vWCcWrHy7x0iypEmPizkaiaCVa+fx9rvWOlWlWWvOBfTqu+x5cjsl56YdM2tcuBry
         jw/gGWB02mKP8scXwravFR/MOexjlT2Qtq9J6YgXiu3w1YaDOnH1pf2rc/y7skM9GgHh
         cKexbeI/T7c1XcpSDeDry6FW66SVH1wA12MksEzJxwNpqa0npcgbySDizPyKQFmhYg4F
         kovg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779538325; x=1780143125; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxKLv419Kh3ldC+z3qNJwvfzNG/QDZIqGAP5yoc8fK8=;
        b=P8MeXwzopwGXjvmNGtM6sPo/ZtzDNJHdKvonxtT55qmJaYTBq/hdwjAGisICCXHICg
         rnj8igkAOSmObWfjRb0Q/7l0g+gm/XHq7SX01C3JH56aLzljHRiERNzEQeS608kI7ruB
         Ykp0xqrGh+HtFhRjO+ZVHvq3Vrnbupz1iU0TK4nsWAcXpNPmUN6keRknfkDxzSotNrEo
         jB6eZ1Ls2PnXIJ9fR0c+qb4oNLJP+EdiJQaNqJyBTuatL4uFQoUxAfpyeXHIi0AYAbrp
         7QLLPPtg7rUN1ZHkPNc2N12uqxZLioy6zRmZXl98RjPSpUDl+byQpRlN3Dkeh6PdneA+
         BjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779538325; x=1780143125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZxKLv419Kh3ldC+z3qNJwvfzNG/QDZIqGAP5yoc8fK8=;
        b=IeiZx6xbde7+tif08VZCxsivnL5MZ/LNnlqaBmaL9ppVIKVIWLvn9ksZtcrUDSw/8p
         US8mWyKQT5hyVQE2nWShauURSrhHjc7ELKZWNv7vWKyHSMMxTDH/3XooDwZFHY1HQT2S
         UPXayXk9iQ0xwZ88SjDEyRtb1p+WuWZBvQAwlf2MQStHPG3YKrOZEuGGoMUsQSyj+n87
         iOOhV5r9oJSmx4vZ47TC6bre3u92sBNbF/cy21eVN9qH9F3pPOsNYw34vyb07Smb5/m0
         ZnNExQWbGBRcMG0f93y9KRZmud5dSLdRILlgnPfejtpwqaYFdbyH/lklUcauc9nGUlMj
         jV6w==
X-Gm-Message-State: AOJu0YywVh37AuRXkqbXb1cdQ1km+hfc8kKf9wuXeKlzQVW29fu4mjbv
	koUp+B7XSNUE5W4/EqsQeEatWpoJ7FC0Laj58ZQakdmWSVeR0nTBXAHx8Yve05SFpy6xU6lL3O8
	NYHd08xb9ULMEprrswRhZJq0BjXl61UihTViG1kA=
X-Gm-Gg: Acq92OEj3pRiVtWVgopMupe1Q2YIW1uGdKUEAI93+L671S+yJCKvuUO2sqrhlLexgJ3
	t+kf1Kzuzk1pkZ0f00OaMHx8aQMqRdpTohDSZ+++PztCz76WjvIEs32nT0LaCkTNdfAjUv3vJaS
	19tS/6GTLxPMWBeSTzn+rEdFedBIvdWUqy7b0pn5Jbv+VWglNmnCrIpi9CVciLcAdYCRCZzsO7D
	HDux6fXwIyndUGNpoHa5k3TciH4m51CtATXFVng2B/pq+1Esu3pCrkiI1y2Jm954WGWMSwY+a8s
	rK9zAUrkqw==
X-Received: by 2002:a17:906:6a0b:b0:bd4:99f5:52f6 with SMTP id
 a640c23a62f3a-bdd264bf66bmr447447766b.34.1779538325204; Sat, 23 May 2026
 05:12:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260523105545.68079-1-technoboy85@gmail.com> <20260523110447.F10D41F000E9@smtp.kernel.org>
In-Reply-To: <20260523110447.F10D41F000E9@smtp.kernel.org>
From: Matteo Croce <technoboy85@gmail.com>
Date: Sat, 23 May 2026 14:11:29 +0200
X-Gm-Features: AVHnY4JU8ub18CMgxZqpIp0auOGoQ3iX31iiMjKkFJEK94iD4Jh5k0bpEIXZY20
Message-ID: <CAFnufp1cM4FXky3xGconcOZpyPueaRQY-VaD9yGMtxP_8ZckAA@mail.gmail.com>
Subject: Re: [PATCH v2] HID: core: demote warning to debug level
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il giorno sab 23 mag 2026 alle ore 13:04 <sashiko-bot@kernel.org> ha scritt=
o:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Demoting the `bsize < rsize` warning to debug level masks legacy=
 API misuse and silently drops valid short reports.
> --
>
> commit c89b6cb8fc074729ec292f2ffe95d958722d1447
> Author: Matteo Croce <teknoraver@meta.com>
>
> HID: core: demote warning to debug level
>
> This commit demotes the "Event data for report was too short" message fro=
m
> a warning to a debug log to prevent syslog flooding from devices that
> regularly send short reports.
>
> > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > index 41a79e43c82b3..503b9bfa5d379 100644
> > --- a/drivers/hid/hid-core.c
> > +++ b/drivers/hid/hid-core.c
> > @@ -2072,8 +2072,8 @@ int hid_report_raw_event(struct hid_device *hid, =
enum hid_report_type type, u8 *
> >               rsize =3D max_buffer_size;
> >
> >       if (bsize < rsize) {
> > -             hid_warn_ratelimited(hid, "Event data for report %d was t=
oo short (%d vs %zu)\n",
> > -                                  report->id, rsize, bsize);
> > +             hid_dbg_ratelimited(hid, "Event data for report %d was to=
o short (%d vs %zu)\n",
> > +                                 report->id, rsize, bsize);
> >               return -EINVAL;
> >       }
>
> [Severity: High]
> Does demoting this warning to debug level mask legacy API misuse and sile=
ntly
> drop valid short reports?
>
> The bsize < rsize check correctly returns -EINVAL to reject events where =
the
> allocated buffer is too small, preventing out-of-bounds memory accesses.
>
> If the UPS device triggers this warning because a core API or legacy driv=
er
> incorrectly uses the old hid_input_report() function, the legacy API
> implicitly sets the allocated buffer size (bsize) equal to the received
> payload size (csize). When the device sends a valid short report
> (csize < rsize), bsize also becomes less than rsize, causing the HID core
> to incorrectly conclude the buffer is too small, drop the report, and pri=
nt
> the warning.
>
> Silencing this warning fails to fix the root cause. The valid short repor=
ts
> are still incorrectly dropped, but now they are dropped silently, potenti=
ally
> leaving the device broken. Furthermore, demoting this warning hides genui=
ne
> buffer under-allocation vulnerabilities in other HID drivers.
>
> Should the caller be updated to use hid_safe_input_report() with the actu=
al
> allocated buffer length, so the short reports can be successfully process=
ed
> via zero-padding instead of returning -EINVAL?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523105545.68=
079-1-technoboy85@gmail.com?part=3D1

Commit 0a3fe972a7cb changed the level from debug to warning.
This is too noisy, I'm just reverting to the original behaviour.

--=20
Matteo Croce

perl -e 'for($t=3D0;;$t++){print chr($t*($t>>8|$t>>13)&255)}' |aplay
