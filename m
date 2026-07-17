Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187F42882CD
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 13:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296020; cv=none; b=AGkqxdu/9X87Sl/aaW3wdXxf+qIZZy8xBhNAlIgFYOSaVPYrTTj7zbFZWCF67TGdX5ZewPj1MawM5ZtDww1tGrwFyQmb+eYZhMy06Ug1d3/zUyY2qy5Wi1JUPgw7ZAX/iacNd7Wjtjo6o9ADyTBB+uMGhdFnrWKLcRN5+t/bx74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296020; c=relaxed/simple;
	bh=pkFpIKsnXuNOL+ArN2UIRyweTbPgoDEDn2DJz7Lvqh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPbsOv72c9hraUCeTbNi31fa1WdliWF842VtdOBlLeu2S+ndefVkc15ErGlYjT8ZoXjNI26Mctb4an+r9Rn/RH1QInWTcI1tFX1ieYm3HOmRYGNXel37MnDQNKLAmiJcDnrhfy6udLhVvKo0a+xcchnfQYt6Y8KK+FWRLgkNPsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+lsw2K0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+lsw2K0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493e4ccccc2so49615455e9.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 06:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784296017; x=1784900817; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=usUeK0ixpk0N/58fI6VofoCsRjg+TZxevKmDKvB1suE=;
        b=g+lsw2K0Kkm8tHsj44FFYpY3QcU1kF3qAJI8yxeVnMTaxEo0Kg7NWgMWAPHd+4djtQ
         zg/Wt1oVhM27m98M27XqHdVl/Btgmqvw/g+yV8HC3q2nt/srChPyR6GqRc5QfC5R3pPh
         NDC3trSYMSCa75W+a/IMGUOZ9mr2F+2sn6zLgSZysAKqsAIkYyO4uY+4rk7ZE5Jdz+K9
         4RxcpbXHe/KKCDySTOQ5zlEqQRNRGviYI5pWSnO5qQZ6wdazNVknuC3jEfCYbFJPoBb/
         6MOqSlBSZAB8wS422gC5hTUW66tHlxGiGC5t5jRCUdUUbnJOKZKAV8baJq6hnfnyqHun
         uZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784296017; x=1784900817;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=usUeK0ixpk0N/58fI6VofoCsRjg+TZxevKmDKvB1suE=;
        b=gup3SmGFBjdhNxX2zBFNaTKzY9KpI6lH+nuoa19e1nlX4MewY7Rm8cCLQmh/CZ4SkO
         VyifhTG3QF2O056CA7w1s4anXoE3bjO/p5JjEER6Nqh9bk3gLwwpsraLRwHDhjcpY9z7
         BrkYdZNoDALl2AF2/E0odnd/gbVYLTBBxiwSmP4UUFuaojNeQ68KJrNw4sRiAIfDz/rx
         r4UJHOV0CqnbHqTlZW5D7Rg1GdPQ0DQv1sqWi7DNCpey77SV0hYVdjf8x07oFyLXJlZL
         Uz2vpqFg4ZB+aOu8GglYgKqscYqhmhB7sviq5wmcccoMZa4ARW/em0Gj4qPN73HNdabR
         szoQ==
X-Gm-Message-State: AOJu0YzrUaHrJ0BaYiihXXhEm8SWGHOKL+iK4uYtVz93YgSkL3RfRsTI
	Gsy8Mau6EQP5/GzTwRB/jgr7gR35fhG0b0264WL/Ix2slmsuiMchR6IB
X-Gm-Gg: AfdE7ckRZre8LhuI3hJ9VQ/f16UhqR+EMCxTktKBnkmv9R7rZ5KAblokNDrYLjKv44B
	V0sKBEqveBA79fn21EM1mRmH/qqPJKpYaQsfwk5TOzOJMqqAi36SoQc8jpJEDZwKMQS0Nm2mA0N
	QXePBlqbaZmX3ze4/sjyc9taNttkBzAMFAdpwbfiYEooadBk/w5+qw18Cws3DWR2VSqdRoceFIA
	Jmxho+cFZ1g0j3L9M5PDxTjHr6MkRnkS0Fokrn2WthPHN2yzrMfvfI/eKiJGU5q9uUvLufICHQD
	xwv0+XUaxTFFC4J1xvrdJ6zBApGWOKJsmRsyZ0jG157r+g5NmxI8HQBK2A2/6qJ7yEUbVRodzeI
	sy34lijrPg+H9+0Vggu34kOIO1la6jInfmRkFTABtLNOTRJc3Cyyn6Qg/fMFgFCMB1j5zDq4B+0
	EpZuIMYe1qEqp0RC6iRcp/WspNN0Y6WNHAaVa74EC8xNfAPnDOEWOla8U9OvZo7AsWuZlJDTckh
	N3UOePutL3okJZyLNBF9w==
X-Received: by 2002:a05:600c:6a08:b0:493:bcba:46a4 with SMTP id 5b1f17b1804b1-4954a404528mr19709365e9.20.1784296016986;
        Fri, 17 Jul 2026 06:46:56 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3f07esm51142905e9.6.2026.07.17.06.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:46:56 -0700 (PDT)
Date: Fri, 17 Jul 2026 15:46:54 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, Frank.Li@kernel.org,
	imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v2 05/15] arm64: dts: freescale: imx8mn-var-som: Add
 support for WM8904 audio codec
Message-ID: <aloyTsfV5ngd431Z@Lord-Beerus.station>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <4487a350b0e4667816c3fe62e9fd6df2696c18cf.1783330236.git.stefano.r@variscite.com>
 <20260706100948.DDA391F000E9@smtp.kernel.org>
 <akvC8UV5N6Tpk0_h@SMW015318>
 <akz_Lr1bRSEE5rhC@Lord-Beerus.station>
 <ak1KYjOUWDy6po5j@SMW015318>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak1KYjOUWDy6po5j@SMW015318>

Hi Frank,

On Tue, Jul 07, 2026 at 01:50:10PM -0500, Frank Li wrote:
> >
> > Thanks for pointing this out.
> >
> > This audio routing is not new for this board. It follows the same WM8904
> > routing that we have been using on our other platforms for quite some
> > time, and we are not aware of any reported issues related to the
> > analogue microphone path.
> >
> > If adding an explicit route to MICBIAS is indeed required by the
> > codec driver, then this would not be specific to this board but would
> > potentially apply to all of our WM8904-based platforms.
> >
> > I'd prefer not to introduce this functional change as part of this DTS
> > alignment series without validating it across all affected platforms.
> > If needed, we can investigate the MICBIAS routing separately and
> > submit a dedicated fix covering all WM8904-based boards.
> 
> Okay, thanks.
> 
> Frank
> 
> >
> > Thanks,
> > Stefano

Hi Frank,

Just for my understanding, is this patch series going to be applied or
are there any further changes you would like me to make?

Thank you,
Best Regards,
Stefano
