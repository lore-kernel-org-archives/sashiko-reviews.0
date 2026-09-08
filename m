Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10695598C1E
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 19:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894521; cv=none; b=fI2RvWssGOmNwmM+hHI4vc9ast/kQyg7VNO5JTSJ7ElUf2/1lVFhJMUQA/+9SdKZ3nU13ZJ3J4QJG9iuDk5SX9LWbfmFHacG0TFzHb5prQSigvECqXXcCXtLGvSeKSvSTy++mgCqfuCEGyAbJpQ1XN/lqnyrcDUDA5flaWkp3C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894521; c=relaxed/simple;
	bh=dPTFHe/0BTatj0iI07P/AMrh0W0nP48S3r20DDxIcDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T6KBOPF3olXOH9dDf3Xl19MY8R160vxWjWhnr+zM2Jvh7OJEyyrPOx+m3IGIFxqIO4P3v17huGE+6/QoK6PjgXFiPQIuCk4xzMeYSDCj31reBMcY3AJVddm9IoXkMGSpAJrQ4ScbTzsUm/Fnnd4WE9wD4sRoja68b6O/MbpVvpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhERn6SS; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhERn6SS"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso42997035ad.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 12:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788894519; x=1789499319; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U1RoL809GoYxbvdVPYLt0/sti3cyzkVabYPMIWYXI5U=;
        b=mhERn6SScypZQAMwQ8zw/Yy41KsKxWv/F3XyNbQwZ85RhGBhU0lWNJhINqlLxlNEvW
         r7lSy/m5Dh4MZ0Sy9icvxwT6peax8zXLc+ILKG/nlSq1i8Yhq+t3qJNDCLUXEYxO/ICl
         T79nkMW/lel3j4w4Fg9J2A9JjGwJcyJKbJrscREK+JNdB6jE9C2kz819gIua/sT42Pi9
         FfVl41plqzlaHoQigW8BeJ1dAl4aKgM7SUjr5aVfGKGibUxSRyZdj/rR/kKtsJTuomd7
         uItq7aXARzlKTRz8j6al9TnUREutVwvqUuAzCUXiCQueMFPa+CGSXwyF5BARMZFWBDva
         s2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894519; x=1789499319;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1RoL809GoYxbvdVPYLt0/sti3cyzkVabYPMIWYXI5U=;
        b=L8u2k1KRvBjb2tL9U7/30vXFzWjjCDT0p5oFzlvENev0i6vfIdBjuImWl9X8mCFbSF
         xLHidgDwMJJ2A17su/E39ytJxmlE0RzATdPOR8avvktw3bblfQNc13jVcly41diIY41H
         9hO63SxfIr1hshB9acqWAJnP2TWvRfAC4ZkqKD27QapudOUUUGjQyPZKAe8m43l9xIyL
         X9BSwykqSkh+6p3Mjpa0qXGh7LGokhdeycGQFPa2OJRJu97+2CVN6Ssj9AUM6L6lP24h
         gFaqm3BpUIhnLNtn3bX0+O7OoBDdjwS95wF25dM8cIdrNwXycGarb87K/Us/cXYS30F7
         Rc/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwzQyQfP6OrUW6EhdQNTXos0Qmo03v8S28QIDp/iW7/AidO9mNDvfRMVukzIpFt7EXWntZGz6Zz3srfWwvtbYc=@lists.linux.dev
X-Gm-Message-State: AFuF++mgFQcGL+PYpF/kRlt3J3IydtgNeg+A5xLpaa+zljYjMaCHsr43
	ZYyoAh+eMo8NRr9FsfZCjsfco+Wn/DKkbcSPxdbqSIEqxEcy+832LrDH
X-Gm-Gg: AYBFou1ti0pDulkgjCR9qPKrju0YkhoVYiER0Rg5SAc0LtBZI0w6OcG86jRcHXbbGJt
	LQI24dWtbrZg5yySKIoNhfPgoaUMsiLWx7UrQ7xtvhHmnaw7OTxIlkCayyMoHcalfRsxJ7tOsgl
	m8CT+LVl69GsIOOVasKBSQ44MJ/qFrWTr4ooXh/NL7xDKTu86sS4Y0A0z5l7f55mTfRBUMhm9i5
	zHCjJ16H0BXkVKP+jSx8zjweaB1p6g/MWRH3TIRRq2FDRC94HFD2Tbw93bmYLoCUdlfhKEbtVNg
	/d1dfdGuRpcoP4polv+MWKrMYEjDMXsThsUytbJtszpfUQnX0jJ/LtxCFNPyNRG9mfiugcFxhk/
	Tf5symryCTI7puNP79Gkr/BcSCKbTH8kx3PvJ7BOWpnblNYc+4DRJua254+hI6ZFwdepGxPeQx1
	ifhZmKNj8NB3sSK/cKFTZpR8RPql+cCdrogynTTGzaZYmF5aZOo4wyr6w0di2zKJBmfBkgKvml2
	3IsbZilYAk4u0AzNQ==
X-Received: by 2002:a17:902:ce89:b0:2da:e967:7953 with SMTP id d9443c01a7336-2db125f1626mr400773425ad.12.1788894519218;
        Tue, 08 Sep 2026 12:08:39 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:885b:4183:b098:c1b9:7033:be8a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b4b2sm62739355ad.15.2026.09.08.12.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:08:38 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sashiko-bot@kernel.org
Cc: aethernet65535@gmail.com,
	damon@lists.linux.dev,
	sashiko-reviews@lists.linux.dev
Subject: Re: [RFC PATCH] Docs/mm/damon/design: clarify when qt_exceeds increases
Date: Wed,  9 Sep 2026 03:08:49 +0800
Message-ID: <20260908190851.341858-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908175548.2D95F1F00ACA@smtp.kernel.org>
References: <20260908175548.2D95F1F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 08 Sep 2026 17:55:47 +0000 sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Grammar and punctuation errors in the newly added documentation paragraph.
> --
> 
> commit 25ab17e2d03e88ea28912107d200a293e1a57614
> Author: Liew Rui Yan <aethernet65535@gmail.com>
> 
> Docs/mm/damon/design: clarify when qt_exceeds increases
> 
> This commit updates the DAMON design documentation to clarify how
> qt_exceeds behaves when quotas are unset versus when they have a zero
> effective size quota due to the temporal auto-tuning algorithm.
> 
> > diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
> > index d036340dae8af..e083b74d618b5 100644
> > --- a/Documentation/mm/damon/design.rst
> > +++ b/Documentation/mm/damon/design.rst
> > @@ -863,6 +863,16 @@ scheme's execution.
> >    completely tried to be applied.
> >  - ``max_nr_snapshots``: Upper limit of ``nr_snapshots``.
> >  
> > +``qt_exceeds`` is increased for schemes with set quotas when the quota is found
> > +full at a quota reset interval boundary.  While the quotas are unset,
> > +``qt_exceeds`` never increased.  However, a zero effective size quota does not
> > +always mean the quotas are unset, if the ``temporal`` :ref:`auto-tuning
> 
> [Severity: Low]
> This isn't a bug, but would it be clearer to use the present tense 
> ("never increases" or "is never increased") instead of "never increased" 
> to match the surrounding text?

Thank you for pointing this out!

Yes, "never increases" may be clearer.

> 
> Additionally, would it be better to separate the comma splice before 
> "if the ``temporal``" into two sentences?

If this is okay, I will change to:

    [...] quotas are unset.  Specifically, when the ``temporal`` [...]

> 
> > +algorithm <damon_design_damos_quotas_auto_tuning>` is used, the effective size
> > +quota is set to zero once the goal is [over-]achieved.  Since a set quota of
> > +zero effective size is always considered full, ``qt_exceeds`` keeps being
> > +increased once per quota reset interval in that case, until the goal is
> > +under-achieved again.
> > +
> >  "A scheme is tried to be applied to a region" means DAMOS core logic determined
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260908175105.42558-2-aethernet65535@gmail.com?part=1
> 

Best regards,
Rui Yan
