Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3913BF69E
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 04:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785126612; cv=pass; b=rM5+HjJNBSzTams9odEa5foR8J6rjkmXrfrXujowsK8wqPsjMnj9BgJtuPrwsS0frPyxCurOElfYDpxx4uGR9xYnHk3DzBkOu59+oPuksC06KNXEjXR5u3XCsk5jkHYfJgUo5WKvra9eaOi823R2rgGhQtuHvLq6o3Xc8XVkopw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785126612; c=relaxed/simple;
	bh=KCEGnS0iUf3IHmlt99E/30/3AnZCRVZ21VN+7LHjlag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eJxlwlHhhhCEh2/pO7pGxMhgTmMdGtmRctvQI0MnqJ9dT7TsKGzKnMav5Yl4fReo0wZRm+uiPdTKDOX7Ob8GuEYMgbsYVPiqLK5lp5aiGFi1e3oAuyfIwL4VKbDFJ/1GcA0vXLP9j4F8sxFLh6I3jNbOxh4vwiEXl3MnjwYuAfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0mPJnVq; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0mPJnVq"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c169ae1cb26so550202566b.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 21:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785126609; cv=none;
        d=google.com; s=arc-20260327;
        b=d5vbG3jILI3XgGmpKp8fsruPyUE+jj0ORmN/+UXEU66kxKUTqmK7CWqiY1K50OgITl
         MwJ2RExddxqzWKNrg9oXkrjtSAtplZimsm34/qAvOg/iq2V5ebuDqvi25oB5GDBL/Jqg
         /6bRTqMDU/3xjXaQ2pbo+D12ANbbjy+Ljj6cFE65TswcKeyCHdRmf7igyUVkQCRwU1lm
         LHXMQy9E3YVemtsWPuhWyxjsqvSWdJo+3SIXZ8EfIIdYAzaZ7BQEk33Wm21/297p0Tep
         sb9x6g5RxOf4M6VVuyUN57nrQ3N7k24lcCve3lRW6BXkOzUxhcqNdZiwR+40YLRjFZQJ
         T8hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KGnrduvUoH+RkUqeyoTUCKk7g0hsKjiB0Vz1x11ZXgA=;
        fh=0hdvEPJRino8wRvGrrw1gATkOs6ExpSix2L2F38xNVA=;
        b=b7ytLTSNQ2JSVtM7sKigFlFoh18FOyZPtcYqtpDrOTN55FI3jhf5gYGONpchdvCA/4
         eA/XAUHGSen/5JkheHgZlQ0aeRbYnx3np7G1rGKst3yDywMfkhq17egit1X0SyZOdnt6
         XfE8PrhE+2DI1dhu+pNqTXu9sZ713YZfAxQl1UY3/XvG9DH895byU+56uFKo+35OwNBx
         GENEeXek4gATyX5aE5jLZSCV1LSbQhr8BgBNw4BxDGkf7L/A8w75cMDBahRPxeG6EUBH
         LShipk4VkkRdze3yjZp/Vhk0Zvwb6r2p80bTyCq3WCfdeGWZdDsAAQJrjcXLDLBNhZT3
         3NMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785126609; x=1785731409; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KGnrduvUoH+RkUqeyoTUCKk7g0hsKjiB0Vz1x11ZXgA=;
        b=P0mPJnVq6VXXZyzZikjP/zX+UTZE6JAR1T2gTrZzSrxiOaOSP3OwTzTIMEGFTh1EVU
         2PCN/UFBjEO2g7u1QvklPx3JCTHUWzr84X7oLdiapkGCN0EQmKwUoTRQg70GFDZj6JF7
         Vz7cjFtjSlyOF0zDLZtE2VytGPm00SbbAqQOJ53Pfw0mIiz0QRPlD9HqRrDps3Z9ggUt
         1+ABS/OhFek/3AOp/9GVXkNJi7t8L+bsKWvZ+3Enboyqf26Bts4vbjH6sqrZ6Gj5XiyD
         u1UaFan5MFRQwSloQH4GiStzk5Cs7MPLvp/AQ6UVJzFpUCQ1r09HDyHjJohH9YyJKN3K
         P3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785126609; x=1785731409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGnrduvUoH+RkUqeyoTUCKk7g0hsKjiB0Vz1x11ZXgA=;
        b=IvsqCNCH75m/jzn2/XyaSAw7yQlDwNJgP9OykkSRq99Fj7VHAwjTNZmkJqcFqSYwLk
         4SRI4f4hjzmcqYBdpXcLBiRPPI7Y82MMEkjI4av9rcdsNRa0iLCSdp9B1iyS8+9sERBB
         LnehjyyAkx2tpbTszx12QLMoEG2H/lf3cWWexp91DGNEj4Nv8tDexv9EsKuQlgcogY+X
         2ONhX/7I6r4gT2YfUKW8mbFF7jLc8vAxpPL7ulkRkpzlkmcXR4p+eaTyPDraZaCgnGgW
         s1Y3d1QSNLIv8gFXy+y1J/gg1AbqUXiV0W940F8GjuepIXsdiY9WaDEiAO9/i40QBrBb
         EvgQ==
X-Gm-Message-State: AOJu0Yx6PBcGIaEEv7gKANLg2bM0TRZJKP1XQYyrlR2WmV/m0cSDWuBu
	jG7r5l19c7fcKE3wJWIflH1ttV6vq8rJVNUd8riTeu5TyJd3cP0KAV7//kiG40WAHdQaNWIyUKC
	+jG0zwn+A0WH1F538SAtjTWDnxH66B9/nNPF1nx0=
X-Gm-Gg: AR+sD13076OmznuPrhHmlK4otp1wTuxs979sVTddvw7hZT8N2ZGg2fd+OjM4oJ2HLmA
	8B+wFbYujckViktRGHMrk7Nzu4EaarIiyNREVBRamj3elW9k7D/ED/o7BW5LGsTWaXZvXj9oTV2
	j3x1gAsBi3yA6DwORqjqNyPOW+FstYvIeZKHNZMOUrPv0q/tiOUALIFxO7s/8yrjN9NfIWB5vAW
	w4FfREZVwe7mkV3stY9lrjZSK+85gGjgKHWIA7sUgKmC4H4vyP4IoYNkgquOiGyzl3hkjVBmyTY
	l6F/3vcknqMQ7qlb6Zk=
X-Received: by 2002:a17:906:eec4:b0:c12:525b:4e7d with SMTP id
 a640c23a62f3a-c1f1fd8d0fbmr303340666b.15.1785126609241; Sun, 26 Jul 2026
 21:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
 <20260727-adt7470_thermalzone-v3-5-21424d550c3d@gmail.com> <20260727034440.2CA821F000E9@smtp.kernel.org>
In-Reply-To: <20260727034440.2CA821F000E9@smtp.kernel.org>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 01:29:56 -0300
X-Gm-Features: AUfX_mx1H-Jm7ldxyuG3MsrwXJYggwfPdPWOAvWQeznd4uyWrVsyILYWpFXltfA
Message-ID: <CAJq09z46WOmZeYXOWpUz1trfNEEjHofocwZgJqOhah-45vwBPA@mail.gmail.com>
Subject: Re: [hwmon PATCH v3 5/6] hwmon: (adt7470) Fix temperature alarm logic
 in hwmon_temp_read()
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > +             *val =3D !!(data->alarm & BIT(channel));

> [Severity: High]
> Does this bitwise calculation map correctly for higher channel indexes?
>
> If bit 7 of the alarm state is the Out-of-Limit (OOL) global flag, it
> appears channel 7 will erroneously report the OOL flag instead of its act=
ual
> alarm state.
>
> Could this also cause an off-by-one mapping for the remaining channels,
> where channel 8 reports channel 7's alarm and channel 9 reports channel 8=
's
> alarm?

Sashiko is right here:

       err =3D regmap_read(data->regmap, ADT7470_REG_ALARM1, &val);
       if (err < 0)
               return err;
       data->alarm =3D val;
       if (data->alarm & ADT7470_OOL_ALARM) {
               err =3D regmap_read(data->regmap, ADT7470_REG_ALARM2, &val);
               if (err < 0)
                       return err;
               data->alarm |=3D ALARM2(val);
       }

The BIT(7) is the hint to read ADT7470_REG_ALARM2. So the bitmap is
not a direct BIT(channel) for channels 8, 9, 10.
The data->alarm is also used for fan alarm:

        case hwmon_fan_alarm:
               *val =3D !!(data->alarm & (1 << (12 + channel)));
               break;

It is too confusing to use the same variable for two different uses
and it is exposing the HW bitmap instead of translating it.
I'll introduce temp_alarm and a fan_alarm and keep the bitmap simpler.

> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-adt7470_=
thermalzone-v3-0-21424d550c3d@gmail.com?part=3D5

Regards,

Luiz
