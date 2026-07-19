Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9691F2475E3
	for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 13:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784467791; cv=none; b=BwKczwL0iyO64lrcmyAo/VtR1U0o1Xbc8U66sACfQHA0W2PXJpF/He2kUGHK5iNnRSB15SRNpNynUxeytVWA2IvD9o/KyhCLVXwUOpt2Ns82qEp40T8LXuPvnpYs7FTbZ+OoAINqVBOgVZv968fKZe8DOQT8BDrKzeno4jGWHo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784467791; c=relaxed/simple;
	bh=Xaq7RQ3DmIHqyyvVvwMjeuLuuIAP7Ugenr1ER60EbtM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FYWqS+uXEEIoXddhpqoQ8GNKUzx05cjM1y9MYdqBlrpyqOntZsZBbHH/cvctFbTfpQ6oeKDJVbY+xDcJLXieBIB4aObOLisujSYkc8aRubRIDHaD7Z2RaT6b86yTaRBoVNRmxUTLYlhffT7CBrcY10Ve0wruUwM5db3XlSrHx9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=E0/PUhhO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="E0/PUhhO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso8213725e9.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 06:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784467787; x=1785072587; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oTTnLvB5EKr1ilWHZeKrVDJrENmEbx/nOStJCKmeMiQ=;
        b=E0/PUhhOOvprbWLyMn8aQ3ljzv4LJuSfhZfr2INBDRBn/a4CwXtz/04FmQ+A3iRPgi
         mgDCQXEynaebk70oxlOUIJEF+hSIOO/ksZUXmAY/rgkPnV3q46HqYCV5vQvJ9HQ0P2qf
         XaAMI5iiwdmxAneOlzbqxUKBrBOwuNOAFaWrZa7vMWWLy2EOmyNTsTAqkZgR8bBZERn6
         h/VCyjSs3hgVwtcVMbpe21SqeGt0C1Y7e2AYJI+Y8OnMgQcByOL9OOxnOqBsbmIDeY86
         M2RdTAtVNcmpJxbUmzl+h5W0z8i4k6+78C5TmW82ywEpTWAnz1GopW3IV/Lg9iyzYm13
         GhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784467787; x=1785072587;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTTnLvB5EKr1ilWHZeKrVDJrENmEbx/nOStJCKmeMiQ=;
        b=g3EDIww8aWxAcxDEnc8j6vNrTzv2bN+cZtRJ573vzAOSvxlvGs3CsND9YlCNLuw6nE
         Y0MzRn/warAMNqoXklm0+mh6SGWxw8ammrbWBh57tTJgeJG9JIladDh97TbowyiJRbQK
         WLVMHKllgL2A8y+OsrdE5r+2HgFzEkQdqq1KkHtvAKmHK13JWRhjAduqVeiyB3ZrqaG1
         HmDjEl9CjVv2W+BQeT5LJEmo4bOUUlwwXnKZ24A0uu0Uxsw4VqW6jC4r2FdSEYUHL3O7
         QSlq3uLbP3Dy88jcHOt/SzeuVPDyY0W+ROzudLpP0vLEEzE0WsLJy0JrsdhDey1K+3b+
         XHyw==
X-Gm-Message-State: AOJu0YzhjAKurN73seCpYNe/y4U7IlUnSObBYODToLOVNLgenSZrtH5Q
	HQnRARtJIdQXOfLKlWW+ZAyVtGguMRbQd6uAhIXv8+mu3p9p6k1nN20KIXh6OMeVl0U=
X-Gm-Gg: AfdE7clY8uw5gf/8C5HTk3Jie3eYajnLkg88jGDFSEfoLlg2BL/2JRYEoO6jFMc/BKM
	WnnQe8xEqqGdLUntD99H31rulLPLBPI8C94QXxAt/gKT4qzUgOGyVBjrq9iuUcPbmk1y/oi0KaZ
	iJlqTmQIfZ5yRe0zwbOZndiy993eMjebMQpXb1ViCu+TcDDE7DcHo6La6abCk7MEErLUoiMpG4S
	s6ZdBSx/cosd3t5DCDktpmCdF39tIxL9PZo/ST2Wo4gM+0Q4PHtk9K8V0o26V7NJhVENF+kUU0d
	osphMy/zSYVzQCJRur1uCtBIENseE8ZE00+N7Jd/69rnfAMmnu5lgiWHqlvCy06GHFdHeSFmx8F
	0O2DsSoK/P58u0aHJxkgCK2JQCmYBN70dUEbFbReV6/gDNAyKMdXBXaGROXyKszzyek2t9lNk2T
	0=
X-Received: by 2002:a05:600c:4743:b0:493:bc4a:fb55 with SMTP id 5b1f17b1804b1-4954a508d60mr115272795e9.38.1784467786385;
        Sun, 19 Jul 2026 06:29:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9a7:ef90:b513:8cdd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4954a2b87c6sm353074595e9.7.2026.07.19.06.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 06:29:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: sashiko-reviews@lists.linux.dev,  robh@kernel.org,
  linux-rtc@vger.kernel.org,  conor+dt@kernel.org,
  devicetree@vger.kernel.org,  linux-sunxi@lists.linux.dev,  Alexandre
 Belloni <alexandre.belloni@bootlin.com>,  linux-clk
 <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v5 2/4] clk: sunxi-ng: div: add read-only operation support
In-Reply-To: <CAGb2v65PmMnm=gusbVRJqwHkMFAdKpFyk8coXK=pf0-dBgv8kw@mail.gmail.com>
	(Chen-Yu Tsai's message of "Sun, 19 Jul 2026 18:59:33 +0800")
References: <20260717-a733-rtc-v5-0-3874cc26abf7@baylibre.com>
	<20260717-a733-rtc-v5-2-3874cc26abf7@baylibre.com>
	<20260717154005.444E41F000E9@smtp.kernel.org>
	<CAGb2v65PmMnm=gusbVRJqwHkMFAdKpFyk8coXK=pf0-dBgv8kw@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Sun, 19 Jul 2026 15:29:43 +0200
Message-ID: <1jqzkzds54.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dim. 19 juil. 2026 at 18:59, Chen-Yu Tsai <wens@kernel.org> wrote:

>
>> > +
>> > +     } else {
>>
>> [ ... ]
>>
>> > @@ -143,3 +157,15 @@ const struct clk_ops ccu_div_ops =3D {
>> >       .set_rate       =3D ccu_div_set_rate,
>> >  };
>> >  EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
>> > +
>> > +const struct clk_ops ccu_rodiv_ops =3D {
>> > +     .disable        =3D ccu_div_disable,
>> > +     .enable         =3D ccu_div_enable,
>> > +     .is_enabled     =3D ccu_div_is_enabled,
>> > +
>> > +     .get_parent     =3D ccu_div_get_parent,
>> > +
>> > +     .determine_rate =3D ccu_div_determine_rate,
>> > +     .recalc_rate    =3D ccu_div_recalc_rate,
>> > +};
>>
>> [Severity: High]
>> Could the missing .set_parent callback in ccu_rodiv_ops lead to a silent
>> desynchronization between the software clock tree and the hardware?
>>
>> The struct provides reparenting capabilities via .get_parent and
>> .determine_rate, but omits .set_parent. If a rate request causes
>> ccu_mux_helper_determine_rate() to evaluate and select a new parent, the
>> Common Clock Framework will apply this new parent in software but skip
>> updating the hardware since .set_parent is NULL.
>
> This is an issue. I'm not sure if what Sashiko says actually happens.

I think it could. I've defenitely made a mistake here.

> But 1. this is "read-only divider", not "read-only mux & divider",

The correct way to choose between the 2 is CLK_SET_RATE_NO_REPARENT I think.

> so the .set_parent callback should be provided. And 2. this is using
> the ccu_mux_determine_rate_helper, so it's possible a clk_set_rate()
> call is going to cause a reparent.
>
> I can add it while applying if there are no other issues.

As you prefer, I don't mind sending another version in a few days
(giving some review time to patch #1)

>
> ChenYu
>
>> This would leave all downstream clock rate calculations incorrect.
>>
>> --
>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-a733-rt=
c-v5-0-3874cc26abf7@baylibre.com?part=3D2
>>

--=20
Jerome
