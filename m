Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7A84A1DF6
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 13:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343703; cv=none; b=PoOCgFa5ywyDzuF0tUTj29e8h4XhBBJFRpN2NUVmhEUuoeo7wy3MkUlg3m1NXyg5b/GI0rFHP5L4zvn5dmFmMmmKovEEDIhJXg3gG3Lr2bGmChgjdYnZRUmRbn2PFyTp3V890Z9qEd0q8s3HpQhEKL72BG1CEgrKKmHbh2xmwjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343703; c=relaxed/simple;
	bh=IRtWVZhPlxkGuhXNUXiZXi34XFGlsr0PVlco6/vlBjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SN2DPMa5zr/+FsONifHba2xu8wTSRlaXBpiIAjC+P3+BGlE3G3MP86TIlkhjhhjCIKfubcJMPRluJQlvT881133sL6e6+1Tnqf7LbR2nAuGHueTz75yE4twSqUKZjyHf6uR3ahSuovsogj3xo2lQ38lza/W36GcqYtXmbawZD9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyjgTrQl; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyjgTrQl"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2df8de41d6eso4773175ad.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 06:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790343701; x=1790948501; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8EotXx3jLW9THDoTXZj7S6IwWVn80ZyJZJ8OuSrsBPc=;
        b=IyjgTrQlG7zbQoT5xMnUaaGHhly2LMUqhzL4hILbPuWngWhDFtGebzEv4MnNnMiCNK
         ErJn+VEc+bVRXt81HnJB9PY5QK2bV7hdc1pJP9I/ECxQcmAwNFNbChdpYB7kfqVWkyX+
         W2zMnAl5ilt+D4LcnAaTIzHpUMrg8C7NciUo7ZCgbM3CEvdx1TB2H4FjqYNqhkdsL33M
         Q/j1SVdGXsxmtWs0ij7d/BgWHGeR/NYC9iVzgjY5+IVXNoTeeMJUpnMpDM83whPXVp/v
         Ka184q2CcMfXrnRP/Njl/9tckn9sHl0DPTSLi2AdJHL+Zbey1K//Wdx3WUMiJXVjeVjY
         RwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790343701; x=1790948501;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8EotXx3jLW9THDoTXZj7S6IwWVn80ZyJZJ8OuSrsBPc=;
        b=S7PCQhuojsomdGrgxii++9AcikU6KyKjN9kAO2P1wzr7cKEeZ3QAUiUBx7ineE5nZv
         jITnUbaVNZwiwspn1yLE9VoN+PTCIVkrjSlqvJJVYNthrd5Bg1LbVr5kXIgWn++F8164
         xGdfU3IDOVLUxJvSnkzke+Rw5ye5kBrW/8I1XuomXR1eXCKotnypFHjlLaiHBSb0guJx
         yc99uaj5BaqprRqncv8erxJgGtO6jKA8R/x8DNVFHTPKMjYrXu/ndocKIQGvqKq0nOz6
         HCFI6nW5JjGn/EQC7ZUF8mw3kbCfXPAE0pFfYccQIZMjQsV9TFKYWlgBy8YkNX2De86F
         MAsA==
X-Forwarded-Encrypted: i=1; AKwUvBzvNICEPyusaI5+7o2uAnxDsszzBnCuREYnDh3ACPVRvzqCXJbRVkL/k5NwwwiBhLKaKPhDcDcqBOcYFKysLqA=@lists.linux.dev
X-Gm-Message-State: AFuF++kLRoxB1xCQDI0Gmpbppj9Vp/nhabcOEyWp34C4kJ2BUYVpl1ot
	icrELCYbXOcHyoij8L8P8Vh82mW2HSRApRLpih81mod/VqTSodUJH5j4
X-Gm-Gg: AYBFou3KhVWdQ/qmoixTA6Aq8y0VBMjy6AfFE5dfh5S1kX/jb5kMEA5qCQhgYu8RPwX
	q0XDeSXHWjNncCGqUS+yG7etTFJOLIb3ESfwE6vnZfpjdZjk4PBJ3uNVo1+J7+OjTOWlTEV0n4H
	sk1zQF5UX2k0A9p5zXQ0dR6D3Qz7+vtnYJbKEqNIMvakLvFim6AflrT4JLui2gBn0rvh/oQbcaq
	KMYsvOtxvxSMykVvmo9/ANpQ0JarhUhIUivsV+ggIRbnF3KXwRMlyn6Oi73Wkesv5UHDxl7oDox
	rr5OmFBhdHORLeyBIe8x1Tt62C7Ja0LsOk7zPrlndWRmeIJpd1oSH97R8xUpTKlL20Nc1V8ZsRC
	fL1t82SV2nKNo8ZN7Ji5A4jAObDTIOrDO2H2yaW0IAIZpY7RgGoOmFdQYSR3uCUvH+MHQF2+79s
	G/WWAd2otxVbzYDy+/SvRquGSgWHS8JSi2zQVI0C3KR9L3N1bB3Iy9gIJotKezcXg/lfsXTryKs
	F8Q2u1M9IbC
X-Received: by 2002:a17:902:f54a:b0:2dd:c100:b2cc with SMTP id d9443c01a7336-2df7dd61e8amr45900365ad.55.1790343696491;
        Fri, 25 Sep 2026 06:41:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91460aaasm10567165ad.73.2026.09.25.06.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:41:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 06:41:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>,
	"robh@kernel.org" <robh@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v6 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
Message-ID: <17c04451-7e11-4d5f-a463-371466d41b0b@roeck-us.net>
References: <20260923105237.7B87D1F00893@smtp.kernel.org>
 <CA+V-a8uD16uG8cc9m7NHVZXT5bU64TYfu+_1POuXeioRAy6Z+A@mail.gmail.com>
 <4f5aadf0-8f23-4871-918f-430a0c99900d@roeck-us.net>
 <TY3PR01MB11346CC8B3C7374C293E0F3EB86802@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2d32d7f1-f87b-45b3-9ccd-95e9773ca658@roeck-us.net>
 <TY3PR01MB113461EFFC2B9B39A53ED1D3386802@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8t3HKQ6D8jb_y-XM64BHkWm3vRw6JiTydSp3rqVr9nhdg@mail.gmail.com>
 <CAMuHMdXZwnRtp=f0iOiDqoLVjBTGVYNbbLeP9E3qjTn3RUEkUg@mail.gmail.com>
 <CA+V-a8tzLEScwpJ1Va-vpEHdJeOjo4v6K8_xTH=aAGZoxFHHbA@mail.gmail.com>
 <CA+V-a8uoYZ80rpmJ4RhOA45FwouJKtFtLznjrXDyiFp6Wne=Kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8uoYZ80rpmJ4RhOA45FwouJKtFtLznjrXDyiFp6Wne=Kw@mail.gmail.com>

On Fri, Sep 25, 2026 at 01:24:32PM +0100, Lad, Prabhakar wrote:
> The DT binding patch that adds the renesas,sysc property has now been
> merged [0].
> 
> While keeping syscon support, I propose adding
> rzt2h_cpg_wdtdcr_count_start(), which can be used safely in atomic
> contexts. For non-atomic cases, we can continue using syscon.
> 
> What do you think?

Whatever you folks think will work. Personally I think this is
over-engineering. If there is memory corruption or some serial
access failure (is that system really that fragile ?), you'll
have much more severe problems to deal with than reset not working.
I would not even try to "handle" that by mandating a second reset
handler, but it is your code, after all, so I'll accept it as long
as it works.

Guenter
