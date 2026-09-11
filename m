Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BE141CB39
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 12:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131362; cv=pass; b=tRnSkbRKo8ZtKHouWQuacrAjvs2QkV4wn/I17/WTTNKcgOVNv1B58wlxmUCVDAi0DAcYPkQlkExQcQT0dm5+xq9IEMXl2L96F79ylMdclxdKynIG1gztWvu5JOcvF9V9OkY7CqsH56iBXHtEzl4GQN1O8Hq6afZ7kJhr8rfJeoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131362; c=relaxed/simple;
	bh=odsNZOByGAhBQJH1KIxkWd2NONdWppsE2/guP4cVzAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=nOPc14eevN1KCZSFzsXm929YR8hZ1t2G/BMZCSPQtd4bUM323FyRZby6DeOju1JfFlVWrJGXK/vmXBTgFfiwIY8B8iN3nHy25NWl4cqIARn21A3GUtfTwssvIjs2XulabhdLxqAYHYxxaPPidrMXygMAayb5oWcDg+IZWu9KMLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyxfmS5N; arc=pass smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyxfmS5N"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-478c01da5cbso304847fac.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 05:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789131356; cv=none;
        d=google.com; s=arc-20260327;
        b=HV+cV2YYHM3ScaiHBhxzWbPsPU7j9EqCSN4IzH5mtp3kvF0h/avchYTZa5VTyJN6xP
         SKkxOW61NyxEBVa3cajLN4gGhJ+r4rwGjgsEeVF7s37ZyEbk2bcOTphLRw8GnBKuAGN1
         yKSnjOFviOrMhgDSqRgsAuWvFnpfSEYVYPxjiikinQC6Lm8P6La2/exBJnifjoweC+Te
         AmuznmKp5SOcnWY49D3+xs30joYCUKyJOqcT+SnTT5YcfVodMhMgee12Drost3rlJHeq
         wswcSRlz+K54JjVG6epiq80ItosEdalp4ZtjiIQuXn9Nr4EyjFB74YdmFESGpC8+cTno
         M17A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vVuLeD2rlV7Xte3VvdFwcStaIxYq1A+x+2gsUgDN1QY=;
        fh=UuEIBvKRIq7mzKoTdrHfg8oBqEUwLmUXvEdzs9U2/e8=;
        b=M6c+3/TiOvKEgiYfzO6qCftRq6A1R+rWS3bSZaxLb3xzx7OIHVgrRw40HYGVanNVbk
         oYG32f3NfdLRC7kl4O4cYLW40tEaxrc48GxRe+XCD+7SIXvPSWCN7fNUHf+rzDYb/ARF
         wcYHXJOG/5nOIUJeSlRMrGORo41JMZY5yU1OmsMOzsEwUizzNfUprrCEvQ8chgSmZjtT
         Lec4NlRtD0CtjgkvsNDGZcokEVxG41Is33jMiUkNqccBaMt09Tc/Thj1e8W49e2WBAeJ
         R7zbc2bD/E0hG6e7Z1/Ak3oa/y8+D7enfK30SzgxDP9FhsiHp80geKZr8nAkSQ5qSu12
         Bj6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789131356; x=1789736156; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vVuLeD2rlV7Xte3VvdFwcStaIxYq1A+x+2gsUgDN1QY=;
        b=PyxfmS5NyGp2b3s/kfFiCl86EKrCNkENppBysgF1srWc9iKIlVdJu1M+4W8O9xtMpg
         /fWrOZOa6KVPHMUb62Wun77V1gIp8S1lwRMHQsfGfy/wKa1xl99l8tb6/c84af7d0KQN
         /SOUy16KvsMnXnnoyEr6mt1Lf0vOKdVlMidYS2PvPx3WqZHzqxGGGTsUlegiTFjn8Qs7
         PJ5gwo0CweGvqFl7G+Zo9wWEmx3vhnRH73wpAMViwcYC3NKkb7VM4KW0m4CcgvvRl5o8
         GqQ0wEjFlUwySw5nXLPhg2KrwvTVs7WROfyZLozVCFHVCzeGTC/R/VYplEsm9Mn/m/S0
         g/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131356; x=1789736156;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vVuLeD2rlV7Xte3VvdFwcStaIxYq1A+x+2gsUgDN1QY=;
        b=YlbJn82iPZQUysXNjH5LmzeQ9uTElq0HGMXrt/w9lJrxpUifFcSqd3xR5sj0uXjMQ9
         HOG1cVhVQxMty8AFP0QurFC/wcaPpZtkTnBhU9oWqImW5ujtmL/Os5nIXDQP2TGZ7uBv
         /QrOXReG+TlIfQlmxfwHbnjeMWH9cCQWN60th6T+A1GoK/dQbSyLhGvbQP3T1J0M/3sh
         7nWxbUw0G50Fg5yjCd1UM964f7bvJTCucpoT/qSx4KoNlehpy0TclulRVdjQQpc7ZLhb
         xgAoSKx1YdSSGgHwIwMOxjnACXeu9WmkB3ggE3g91lXrE9QL0b8geI19DVeo7QGGN9LB
         NVkA==
X-Gm-Message-State: AFuF++khwg6WLddAWZf7SwddtYeRuTjnKlNvAlCCxnHyJBU5drz2WFuF
	/ios/BbKmRbU/W5da0XB+krcC90+kpQdZxP1fZA6cH1v93gTPjDOQtROoZd7K0tLbHF3W4wxPBh
	JeK+yE7qc4hBSewdOAVhdn8jWA2y6rDtlddOH
X-Gm-Gg: AYBFou1ozaMrPq+GrRId/BulyAYnURX9IZit6eNa8Kf3slwu/bsUABLtaTRZmcf+Dbo
	+AttNP3kaLBq45ceE5fUxHE3xRb/gcTBFvfcECPn9DJbeQx4qj4yG+UNsv7jBBJ6VJtG1CtEIF1
	2OYFIwxn1kc4OYUoxT0hOvDOZRQCT9ZVWuJzj0AKqVNB0EsPSk3dLQ1Hs6j4aF+TemVcpSu/lZh
	09HxG+R0OSC7KWMwGX4aPnIECviELR+Q7F0qCHNLzXpVSKB12wQ9nntZXltimj/GZvCbNxJaJGG
	1KO+e1FB5NLj3ttE/piNCbOfOk4mavIR2ZLbwbs1vsdhqdOtiTPEG5D1Yk/7TIywF81mHCOKyja
	Vya6juEc1hsOL
X-Received: by 2002:a05:6870:4507:b0:475:e0a7:9f2e with SMTP id
 586e51a60fabf-47de95f774fmr2773257fac.28.1789131355668; Fri, 11 Sep 2026
 05:55:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260911115346.17133-1-meven@kde.org> <20260911120208.21698-1-meven@kde.org>
 <20260911121058.3B7DE1F000FF@smtp.kernel.org>
In-Reply-To: <20260911121058.3B7DE1F000FF@smtp.kernel.org>
From: =?UTF-8?B?TcOpdmVu?= <meven29@gmail.com>
Date: Fri, 11 Sep 2026 14:55:44 +0200
X-Gm-Features: AcwNN1VJ67TRs-StbN0V8jxCtrszebpBCkw0ihM3AxZMa_H9Vt-oTec7jKLV18E
Message-ID: <CAOvFf8NnQwouiKmccNotLMY-XRsW0ufMAXfuK_tqKp3Bjpdmxg@mail.gmail.com>
Subject: Re: [PATCH v2] HID: logitech-headset: add a battery driver for the
 PRO X 2
To: sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> The HID subsystem guidelines specify that hid_hw_stop must be called befo=
re
> cancelling asynchronous workers.

Stopping first is the unsafe order here. logi_headset_poll() ends in
hid_hw_output_report(), so a work item still running would send on a
transport hid_hw_stop() has already torn down.

drivers/hid mostly cancels first: steelseries, steam, kysona, asus,
nvidia-shield. corsair-void stops first, but its battery_work only calls
power_supply_unregister() and power_supply_changed() and never touches the
device.

cancel_work_sync() handles a work that re-arms itself. The only
schedule_delayed_work() calls here are in probe() and at the end of the wor=
k,
raw_event() never schedules.

Which guideline do you mean? I see nothing on this in Documentation/hid/.


Le ven. 11 sept. 2026 =C3=A0 14:10, <sashiko-bot@kernel.org> a =C3=A9crit :
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The driver cancels its delayed workqueue before calling hid_hw_s=
top(), which violates the mandatory HID subsystem cleanup order.
> --
>
> commit bd334ae3e07d607cf268d197e4923d3fe7f27cad
> Author: M=C3=A9ven Car <meven29@gmail.com>
>
> HID: logitech-headset: add a battery driver for the PRO X 2
>
> This commit introduces a battery driver for the Logitech PRO X 2 LIGHTSPE=
ED
> headset. The device reports its battery status over a vendor collection
> rather than HID++, so a custom driver is implemented to poll and parse th=
ese
> reports.
>
> > diff --git a/drivers/hid/hid-logitech-headset.c b/drivers/hid/hid-logit=
ech-headset.c
> > new file mode 100644
> > index 0000000000000..9081ddf5f42f2
> > --- /dev/null
> > +++ b/drivers/hid/hid-logitech-headset.c
> [ ... ]
> > +static void logi_headset_remove(struct hid_device *hdev)
> > +{
> > +     struct logi_headset *headset =3D hid_get_drvdata(hdev);
> > +
> > +     cancel_delayed_work_sync(&headset->poll);
> > +     hid_hw_close(hdev);
> > +     hid_hw_stop(hdev);
>
> [Severity: High]
> Could this teardown sequence in logi_headset_remove() lead to a
> use-after-free?
>
> In drivers/hid/hid-logitech-headset.c:logi_headset_remove(), the delayed =
work
> is cancelled before hid_hw_stop() is called. When a device is unplugged o=
r
> unbound, cancelling workers before stopping the hardware (which unregiste=
rs
> the device interfaces) means that hardware events or userspace interactio=
ns
> could theoretically queue new work after the cancellation.
>
> Since devres automatically frees the driver's private data after remove()
> returns, any lingering work executing subsequently would access freed mem=
ory.
> Calling hid_hw_stop() before cancelling the work would ensure no new work=
 can
> be queued.
>
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911120208.21=
698-1-meven@kde.org?part=3D1



--=20
M=C3=A9ven
