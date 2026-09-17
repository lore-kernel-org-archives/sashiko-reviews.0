Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6234C58F07F
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 14:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655266; cv=none; b=KyxsKZBnrGdrXadpUqDpp+MNZBvWtq/6LVut5xnTVsTu9fD3mN6LhdilBII4f2vOGiF8dvbXCz7a2IvE3A/AISiJo/NIHKwiZYUK9/jYEsRBKSqNsiCeqgT/rvqFE58Un1jwWcRSi+dsNcYTdlmWV3jYFUzHinSAgcw4M1PjSCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655266; c=relaxed/simple;
	bh=tR4az/LXX1uPEVPqZly1MWtWJFRe2M+C1Rbz7GqFq7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bVZ3r6iEHW3ey444AadHOTjvRZTO8EacdZZdSS2QKo9+PsB1RRuwjyrnTcMbX8oTx+xdbhNY9/FCL5LwUlgQT2rnfN9dCKXi2ZRtPOHggB0GIzTQOTPNDYgBQ1tqdA2Czzft05OVaQoZbBuBU0B23qopIOTi5P65iuxoy48HXws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e512ee6so286869e0c.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 07:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789655263; x=1790260063;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2PUKRWOpjzB1uTEg8aunaQFp5fJugA1o1ujUfXk8Z4Y=;
        b=NWD0sDkZcsFBeq6dt0Mog0ef3a16GOyjLbpFj7TBUf4UJYe3/ZipZPNIqvut/8rGx+
         apkukoOthlRzt6Oz8yX0oZz5POceCamBx8YsMKhUVK58Feo12ZcyrqNyLAPzvQ1Pwmj9
         JjQJh7ZM2Xdd5tK046baF0/+U6nfBxcmRCH5U4J1clTiNj5TqoSEzZD4z/c+ZHHyQtVv
         HEwvD7DbW91GdQPtc889PcwpZ5YwNOyg8ki4bo855XTYuobHBj1kxq2Y91NMNmnXNEJz
         QlqrpmACdFgC55lx/Y6hr/MLA6NCO3+jsWYRh+L8nVTr+mVuk5bnmIC6zfVg20/Iabmh
         gUAQ==
X-Gm-Message-State: AFuF++mKHigHpwD/ALg6je/4vVUakjmiXO2b7mIo5O6TqyLZIWMuYH51
	8+7Saa1FQwHw2Vl3prrYCunwejCbjBdFJu46mKLqKKq9U50KWGvBVcvi61ql0Xul
X-Gm-Gg: AYBFou3vVf+Mibvz2MBC53I5IcIzOb+Ziwgs/7zorishwx7rA5MFKlPypp01WqqgI4l
	jzXws2WYxW++snvDNrC9mWMQr3jcdRp7FmQrhmCylk1CiqdwOLDY3tuwvE2qWo9gDyCxBQvDPkc
	yek+7Zz+300ev1Ark9+QW7/j3Agf6+kNlNpfo4orsrRrWTCPhPV2PtU7Zg2dNbLATW87v770bXm
	thEUtSe5Z875aArmUTlcz3mdmRpkz//tTA4emjARoFhElt1/aGC9VhW/dZlwESlNhIavZL0+Fy4
	3DFZBbygWOhvDI7MhiqD6KdWY4okafE0QpPLsXC6oYt6RZzLLFeebZJbCF0OV/zrMZikADbXpOh
	mUOdAHaxNz2rdx0/b2TCPKHkwgHx1KpyGQX38QjyJy+XaUAG7pl2025O9I/ymoKC0ThWzmNTImZ
	Q/KVts50MOSeX3mUVcBGyLdx0JOKdGx/8i2MBLy/T2G/1nITaR3XHMftLjOTd3cGuj4v8K7mym3
	F5e1hJuNnnC/fg7erSRHfdnWwVt/BkSqpm9UQ==
X-Received: by 2002:a05:6122:1806:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5c9a60d39bemr2192471e0c.14.1789655263013;
        Thu, 17 Sep 2026 07:27:43 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9a53b2ba1sm2708440e0c.8.2026.09.17.07.27.42
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 07:27:42 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982db8d3b1eso248180241.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 07:27:42 -0700 (PDT)
X-Received: by 2002:a05:6102:3f06:b0:79d:e3a3:4ec7 with SMTP id
 ada2fe7eead31-7a028d64e77mr6733201137.8.1789655262508; Thu, 17 Sep 2026
 07:27:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4d6e5ac045af387dde8ef3810ce08c7cb079fc29.1789653872.git.geert@linux-m68k.org>
 <20260917141443.B68B91F000FF@smtp.kernel.org>
In-Reply-To: <20260917141443.B68B91F000FF@smtp.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 16:27:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVgJkwkoF0-ptQ9g_8E5j1Oa8G41nBiiOfY+KF_p7XAxQ@mail.gmail.com>
X-Gm-Features: AcwNN1Ush8QJQXkRhAfTq-tWcBhQ0EMlNvr04HXsZawb41gsyRT18-MJVn4i_LQ
Message-ID: <CAMuHMdVgJkwkoF0-ptQ9g_8E5j1Oa8G41nBiiOfY+KF_p7XAxQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: renesas,scif: Increase number of DMA
 channels to 6
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org, 
	conor+dt@kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

On Thu, 17 Sept 2026 at 16:14, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: schema allows 6 DMAs for older SCIF hardware
> --
>
> commit ca96f7e40234020713acb3baf706d0b07d5dcc48
> Author: Geert Uytterhoeven <geert@linux-m68k.org>
>
> dt-bindings: serial: renesas,scif: Increase number of DMA channels to 6
>
> This commit updates the renesas,scif device tree binding to allow up to 6
> DMA channels. This supports the R-Car X5H hardware where SCIF serial
> interfaces are connected to three DMACs.

I wouldn't bother adding further restrictions, as these are not related
to the actual I2C block, but to on-SoC wiring.  DMARQ is just a single
signal going from the serial block to one or more DMAC instances.
The number may also differs among serial instances on an SoC.

See also my similar reply for rcar-i2c:
https://lore.kernel.org/all/CAMuHMdXj04QoxituCF3wRcyzN7qZrVBn7-ukNkKDd0OfhB8zOQ@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
