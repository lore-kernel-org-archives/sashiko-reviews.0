Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848590;
	b=HqOzHRHavriZu36H/nDJrsOpRgSov7ruObjwQKDHX2iV6igZkQ48IcvZf3CnZoL84+RV
	 vESNsZTV2+h6N4fJdO8fq1PTc/QvrP/f6Ve2W5aZd3c2PgKAAvOPi0NotDoABarVH5qkj
	 U2ZJ/NoO0JQ3LHILBp+Rozv2EPxaySsiPxN/UBLpIFTl7ykKE9WmvCiLg2r+CtbcnZ2tA
	 iGGVxaRnKzAP5mezIALZfQ6hFjXJOLQcR/DcDNSpFNZfMGtoGK2vGWbKy453amAPq/S6q
	 EEx3F5AyAQQfe/bEd+VOAZewUNUiqgep20vFpnXKnKQh+fwgj9sBtXwI/ZzLMwmUszw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer;
	bh=dErzLNRvBxXtOvVGiON0ydSBhI6280GOhN51Vz31A/Y=;
	b=IPxWgRj3Ff472tgzOtKgfAgKPlJqgWesrgAMW2kPTo2nY6JjTTk7ict/vWZ50TyeD318
	 1FedSnQdQ2c1Fw0vDkWNBGJ6d260wa9Spor068UEPt1gvE3ww3te/sbT5loKLs2nl42TU
	 wqU8ui71thn3TIOIe+Be8R6jKi6pXZ1AxBJc0kKlHc+v3e5dIJyHxoNtl6xsIBD6Od+62
	 VTkRn4rAAKGcc0GE+kYIEuc7W6OKNlv7BuaLd2cqKE8CQ5WPt2OFiZug08iZ3EIf2kamt
	 mCp6kBC7G41TAwAF4AZC57GnE+p0WG8KqLvqCCZ6v3poBlWk4E3ZxTcE2fiVgl3QGyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hq64r+hS;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4EF606A884
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 17:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E4EF606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hq64r+hS
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37628596783so6166615eec.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 09:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794848585; x=1795453385; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dErzLNRvBxXtOvVGiON0ydSBhI6280GOhN51Vz31A/Y=;
        b=Hq64r+hS74ZuwqDf0vFHJoamAzx31lpuCcy203Ti0R0GHqvqYvGBIHeRahDShD2OPJ
         0DlYtDQ1xD8DsuSltWW4iJlCcet+cBV7zaW+mlzFgzrAMbPFmWCGczKpGiyjAa4u5x06
         6/68Gq0ZaPOeQiMUWFPOdxZghLs+SVRLaEYJ5Q+BGx2RM4sFGSPD3x4QPPLPqi+rmid3
         fE6pFd4EcJxv7ZIfe5NeIn4D/ROtLz2YXsaDT3DfDl3je/TNzLXGM7gM3LqSHmKloghi
         kVNPbf8Xc5VW0rk+qt2Jt/OvAfKCTyXwXjmgMzQguhpqzlJEMH8w2PLXu3izkPPNzunr
         Sbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848585; x=1795453385;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dErzLNRvBxXtOvVGiON0ydSBhI6280GOhN51Vz31A/Y=;
        b=q2qPSsA7eoyNADb+KSfaUWws4hmw5Ek+ZYKYc/d6WkSY2M/2wIPLxw9n8o7N+WX4Z/
         J7L3sS0BZEAkEzJ6gf+h5vdgKfkyZx32jQq4P067PPvXJfkivjTCh1WsYL/ZTD1qTVUZ
         UH0sog8toBYukPrizyVGE0uyUCflNj+1BVPuizCdKC7VOalfR5on9TckGXd85MqzhYxN
         B9HOcmw+JIjT4MUD91Fz00jF7NzqZIgC/qDTAINyOScey6T2iby+UL8LXB0tz9G24an6
         IZN/bkX67dk6HjF8k/vvQ1Nhibix2K1iO7JB3HxW4E51Z7BuFVsQ/gtEepQRQFASz1yB
         P9Kw==
X-Gm-Message-State: APuU4Z9Fh/DXQyDFYedtEjVNGW6EQ7vo3a9DEa5sDmRqFn3UYIMosEXj
	pShlTUvVOLNrkD48qsnXCzy1aCmXQKw5Roj84v11O85G3mDcFXTja+256TpzhfcF
X-Gm-Gg: AYBFou3bMzubTObgfKzZIKnEdlit/WLMr3tYISfwv8Bo4mdj4pEx6UkbxlI9KbrQeUB
	Uz3mX7ghkwz3N3Mgm9ZJv66x40EXshzUOGjQGzsOnWKllqwJ9bYeMWsF6gbWNmT0K8/W12mKWka
	TjyPP3U8GPxYMqK6ah6H9bgsSkbSMcX0k1vjZgjvRPu+rpVjF0oKz3vqEiGLUCKeWM+iue8yYFC
	lZITvO0CMyibEbEMGU/T5Wl8hSRTx8B9AslRpNcVoj82B9IAdxIp53hBqvStg6tcTC+FZFAT2g5
	M5ZNoz3INitD3cn+ps6dTvkRaK1T3bXalBjuiO4sPh+lxoz4ifKTfHVbMwmItZ1nnBQKddYVuo9
	UXtsIIOj2Oa1WnQloIdW/xpetu4fzVv1AZt/4mt0EwSDUrWvaYN20lHGVgA+d/bLLvrJ7Gp+kUN
	bWayx0VapcubW8mQ3UGRmaz6fDZPdYDSm2hTbO9GJJRBAxJS/1itV4WjA/vgQLkjX2hUDhp35iK
	OOWkmCzgdSYIC+qtzDo4vT09gaNWhi/us9SvA1Z/ZvogDbaZAUNjldRp9iXqCQM3VUYBDGs7/5J
	cM/7CrCYlri+uLV/MVuZztdJLwGHQSvk5Fnu
X-Received: by 2002:a05:7300:6da8:b0:36f:14ef:ad08 with SMTP id 5a478bee46e88-37965abb5bbmr13878650eec.9.1794848585025;
        Mon, 16 Nov 2026 09:03:05 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:e2c9:cd5e:3a2c:ae0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm36363384eec.14.2026.11.16.09.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:03:04 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] scsi: be2iscsi: Fix NULL pointer dereference in memory
 cleanup
From: mdshahid03@gmail.com
To: sashiko-reviews@lists.linux.dev
Cc: mdshahid03@gmail.com, linux-scsi@vger.kernel.org
In-Reply-To: <sashiko-outbox-202780@kernel.org>
References: <20261107093611.42311-1-mdshahid03@gmail.com>
 <sashiko-outbox-202780@kernel.org>
Date: Mon, 16 Nov 2026 22:32:39 +0530
Message-Id: <179484855979.18018.6059499367901614954.b4-reply@b4>
X-Mailer: b4 0.16.0

Hi ,

Could you please review and give your feedback ,when time permits.

Thanks
Shahid.

On 2026-11-07 09:43 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] scsi: be2iscsi: missing Fixes trailer in commit message for
>   beiscsi_alloc_mem()
> --
> 
> commit 3a59c9fd50bd58745d465b3451671b988442c55a
> Author: Mohammad Shahid <mdshahid03@gmail.com>
> 
> > scsi: be2iscsi: Fix NULL pointer dereference in memory cleanup
> >
> > During memory allocation ,DMA memory may be allocated successfully
> > before the descriptor array allocation fails.
> >
> > In this case ,mem_descr->mem_array is NULL,but cleanup path tries
> > to access it.
> >
> > Use mem_arr_orig to free the DMA allocation of the current
> > descriptor and handle previously allocated descriptors separately.
> >
> > Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> 
> [Severity: Low]
> Since this fixes the error cleanup loop in beiscsi_alloc_mem() from the
> initial driver commit, should the commit message include:
> 
>   Fixes: 6733b39a1301 ("[SCSI] be2iscsi: add 10Gbps iSCSI - BladeEngine 2 driver")
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261107093611.42311-1-mdshahid03@gmail.com?part=1
> 
> 


