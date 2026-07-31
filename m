Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424E5432E68
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509965; cv=none; b=L/+eOWuzYad/eF5v4sZ64dP/tXJsvzygaRNm9oU5J9o1FvlVarnnNWG2inO2QCwoEzH5vN1J//o/ck66LMNeBBXm7K49ghjSWAmJbAmPm2aWSRhUmxwPwdvYBxMPeMPKPtIhjJa/jDKE8sly7/3RN03N9ml49SUhK5+i07MVgno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509965; c=relaxed/simple;
	bh=stRXzenw3Z/xvLD9O77Il60Pnz6mkvyxTAqPw6y1Mdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ltnkUPvgp23y8SetZOV3WKqoeZduWP63cKDhwknCpnX8I6xMK/c+AXJE3CGIxDNgqnGk1lftX0Rgr/2q8rb8EizQs7r1wMiuJbPHsPGx2/HUEWWxl1YjE3BmHUcLUJ1sYkyODbOs7wcJhbE4fmdExa+VFCj1f/IbxQEqUFsqzrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IF3gSZRk; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IF3gSZRk"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15f020a223so166127466b.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 07:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785509962; x=1786114762; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vb/M1vS07d61qOG/LSX+wmZe1GvzeRqQzFPF7ylBtqg=;
        b=IF3gSZRk0KjZXYjOdAq8mRfVhmOuKbnyPCd3hdw8ja1HaX9ukHYCELR2srTtU/Hi+C
         XpzUKKWvHx7xusuvChSSQiMRgCaTMSYUIZXOFJqtl8pWtHnR8u4Oa9t+V63nrgoVYxBq
         l90bGcAnbigjp5R3PZXvH4c2HZCe5Jy+6DVKL8NacVk0vIyXIZ0dsM+zqowd9cwjk/Na
         lAIT2VcB9aYOXoTBTPsG6Petix5Gg5uuct4cK4/M3qK1N9BdV+aH0A8MVnAN7SP3rqQV
         yMQGrgtnksm80tsZ2rl63yLFCTCX0TGAWo1BN6wzeqIVP2WufenPtHScSsbHPuTXev9d
         pkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785509962; x=1786114762;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vb/M1vS07d61qOG/LSX+wmZe1GvzeRqQzFPF7ylBtqg=;
        b=KTIiYWrviRIJDwZ2mwmV5PmHwEm20n301XTXp61UOHn3k6LAUKcBMIXojiIPlNk638
         CD4Ndj6wbFOPB2gZXPUTRdSFHof4Kxfm3Y6ic96ZNhmnZlnULet1b2aHf9ggfvAgRVwN
         IUAEV8T9kW6JQbF5b4zhQkOBR+lTQtDy7Wn1VgZ9J89YKHkCJLwDiPKdf9odnZEl00S2
         tkPEOObLwWIR765Tnpsdg8caDjiQhqVkOTDeXKwBpt4qwuOenPDT7kaGX7nh2UDJi80W
         PLJ/YVHgcCM2gwt812JM0kPmsPOD1E3NkEfXY/3RDoKEbxvj/sQO54NizlM3tHpKA3sb
         Is8w==
X-Gm-Message-State: AOJu0YyJs5kz69vLwov0nsUpoYRLwmySNe2Zmr/4eO06t0McQ+XrQWuP
	HQEjzsq1+4C5HEzmf8p3CYOf/JVWlemwlq4X3+XI1U34z9feqFSu0tacGRrr87+A
X-Gm-Gg: AR+sD12jR/MAeuXhH/RxoymaYiC46VjJdY9ZgltPQPs6qxackDPV1oQYV+0V89UosSF
	f5xmyM2dIvL6ofOxQ9oTzwdpSnds2rWFZ7+zaq6su7luYS3tHx3wRM0MpD8DWCjiJomA1ViMaCH
	abcm2YHQY+jmaCVOjHgDF3DbJrHw0eFEIaoUUREC2Fr7HIXhak/7ET87nL2aSGkl0SsLR3AeolV
	5S/X/nRIy+cZ0mWVb3jVOt+0s1Q04NL965f+5KWjxD/keQRU0ZeJWDnbj/0PE0gZgfgaILrVDWU
	HywkO4SN4rLrd/lCVEgeL+Dv7VluQcFZdQKO7Zqa2SDzRpul4SmS1wiiyBn8bseMGGHyyu9ujPd
	1DUivMMuMOn1ogFMjhhq+AFODWWJ7Q9OG4Kc60pytreQz2HtxJZHGX4/RF0OFexFZK/69bxw3Ng
	Y8eJ//YJF4IqYQvG+HD6dQrqgklvLBOsfP62P52E1NEEpMbeeIPl0NVOfUb2oFfp7Q7TVz2IHYd
	u35ErLF8BWMvvlWKRyoFyzDePEA5/pfal1OUiJiQ4ffeYSAAi67V2j0ytHbYqGlrjXWLx2rEuPt
	tfhS5wpLg8llYiOsJrny7elz1dxw1xmjrIGMzQMr+XGSROCy5wGnsmCun7rJS7q1nBzvXYq+eRG
	hV+amgyc=
X-Received: by 2002:a17:907:97cd:b0:c15:fd85:c5f7 with SMTP id a640c23a62f3a-c1fd1e0fecbmr152256266b.4.1785509962165;
        Fri, 31 Jul 2026 07:59:22 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a8d0-bc01-6d31-3d12-3a11-d2d0.310.pool.telefonica.de. [2a02:3100:a8d0:bc01:6d31:3d12:3a11:d2d0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4537755sm182902566b.54.2026.07.31.07.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:59:21 -0700 (PDT)
Date: Fri, 31 Jul 2026 16:59:19 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 4/4] serial: imx: serialize imx_uart_ports[] lifetime
Message-ID: <amy15DcfY_ox0Is4@gmail.com>
References: <20260719221014.44354-1-kmehltretter@gmail.com>
 <20260719221014.44354-5-kmehltretter@gmail.com>
 <20260719222501.CB4CB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719222501.CB4CB1F000E9@smtp.kernel.org>

On Sun, Jul 19, 2026 at 10:25:00PM +0100, sashiko-bot@kernel.org wrote:
> [Severity: High]
> If a duplicate UART alias is probed, such as from a misconfigured device
> tree, does this unconditionally overwrite an already active port's entry
> in imx_uart_ports?
> 
> When uart_add_one_port() subsequently fails for the duplicate, this error
> path sets the entry to NULL. The original port remains active, but will
> console callbacks that rely on imx_uart_ports[] encounter a NULL pointer
> dereference and crash the system?
> 

The existing code already overwrites the active slot.
If uart_add_one_port() fails, this leaves the slot pointing to the freed
duplicate port. This patch changes that failure mode to a NULL pointer.
I'll reject an occupied slot in v3.

Thanks,
Karl
