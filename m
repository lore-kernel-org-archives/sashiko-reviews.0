Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1D138945A
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 19:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779133593; cv=none; b=jek0W/E59hTP0ZB2unDejr0gOtsRnAC/OQX53MKYa8eeEGXJtDfa66eayZbBacl2J2zqBMWd3npGmmCBfKCFXDfF11Os4/8yuCOvh5yBA8LqzOQHScBeLL924kAZsWxqJqxr3Lik/bBzTsKkpax2WccPj0crpptkzfVnnfhw6F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779133593; c=relaxed/simple;
	bh=VdwNJ8/RRSGa6smjQtGivvMghdJohUW6vOp7PH82XIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TpkQucABhBm/9ZLRv7t3ih73jpA+dbyToRtFy+8m3TZ+uzz1UDOvfIAJeG+UGaYUFDFWLBQ7Ano03iVanqmCDt13J+EjzQOQ4YV4UT+x+h8hDKgUyptkFrpXtedEWPAlH0Nw3miC5kNJIdXLkCjFALHpYzRHGVAC2/Ao/bH81sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGaKiCl/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGaKiCl/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so32618675e9.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 12:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779133590; x=1779738390; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=12EE8Opxoylr62oq1gP9QJGH+sUKwH6pdG1cIQyJcXw=;
        b=CGaKiCl/4EjTQKyqU+bWcVUP1K4Mg+zecQp7tFUd+BMsuJzLOCp1w7aZVnFRTXILKo
         qCLCfq3MRfiYIEjd8MlVO3/pj5GWetn0ndmyEpuNQb2rB63f8W0bdCRnAtT5JoYo+/tw
         v6VQrqX8Il1akH6CpGVWMhiC2KfMKrEeEpiV7p5UqwX9LJ3g5UEeL/vW27s4EYr3a2YW
         e9aSYNV4uvBsKbBIXIiEqznuv4l93KwFLDyVn0ceV12/ewY7l/PLgA8RNXT++FRI8z34
         wMhzzGCfZQVDKrBv/ySyrAykc+RSyihzb7X7MTnW6BADyE/H+qS5XFGOKk/HLF3X1xwg
         4/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779133590; x=1779738390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12EE8Opxoylr62oq1gP9QJGH+sUKwH6pdG1cIQyJcXw=;
        b=FL1zwdpT9OUvoXYxr9Cu4qh3sqDCRIzMdRkuNU+JtqXtDsCtUDixCU87XznraMGMdd
         wp9Ux5SpmfxEiVD2Cc23bg73ddTN1nkef3HTHAPNm5YT2YQd5Z75quMPKoCstEReZhze
         dXG60MojGGfGh217NzjbAsLTqIyWvfdm4t5nN8YkXZ7iYCQTi2CzhGIDkHv30ov0QKKI
         SUJkNARXgI7cEz/xj2CyX5+sDtjhCwd/AbLxK4dtXNkz4iG93T/wZnseOnHM8SMPx/UB
         k06C9NSCnmbB3bOooL+Q/q5lhJYP9aQ6LP91gvdNKO4tZ4cgIuZ1/dnn51O47w7Gs+jC
         YReA==
X-Gm-Message-State: AOJu0Yw6RyxJUHrOyHXSdHlRmiEc8Fk6RwBGV8IioukoB9KxxbNnmBRY
	DqDsp/f3s/9xELRewJ9VMxIc09q+SlhnVbdhr3LjPHwRHNhcSdXDqi6GtinYL/nY
X-Gm-Gg: Acq92OGIq5AqEN9ClZtOBcq++oILGRMhkvYrnOojtApMheQV7ayDdCosvXAbUs2+aOI
	LnuPnC+tkCrcS6R7z4SN0XjVoLA0lcHnb5CxGYxmuLyC3s4YliQ962chh9RKpC9tdddlGa+WaIK
	MdwiX0Z7GVMDdoLWkPcD+Hj+Z+4v/F357G3YeArAIIBsixWJK2flzVt4VjDwOeB6OwIOzoyg/dA
	HYIt7tGCaugNHa6nj5NrYC8UjkbMkVFrdDW6RCNHISSjkLTJ/MgGDxu2UaxiSkXwCfhSQsEZIVP
	XQ/aKMUY1IUsyH1CiLiX+o7z9TYmIJVWXxf81N3C98KEVWCdVqEhokOJQ/VjoJdqtjkfv7PvKGY
	9/U4Z+BADjY1WBzAx0gywtYfRwNLgKvFxZjt3z+dzC22UEaVzYlGFllktAIn4CUKqboRlgrGSuQ
	YRCyMYGxA=
X-Received: by 2002:a05:600c:4504:b0:48f:d1b8:9a9c with SMTP id 5b1f17b1804b1-48fe60e14bamr246537865e9.7.1779133589646;
        Mon, 18 May 2026 12:46:29 -0700 (PDT)
Received: from localhost ([2603:c027:c000:3cde::f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f8799sm165921765e9.2.2026.05.18.12.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:46:29 -0700 (PDT)
Date: Mon, 18 May 2026 21:46:27 +0200
From: Louis Sautier <sautier.louis@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 2/2] scsi: mpt3sas: add hwmon support
Message-ID: <agtsk8mSxPaIz_tX@localhost>
References: <20260518184109.770185-3-sautier.louis@gmail.com>
 <20260518193758.889DCC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518193758.889DCC2BCB7@smtp.kernel.org>

On Mon, 18 May 2026 19:37:57 +0000, sashiko-bot@kernel.org wrote:
> > +config SCSI_MPT3SAS_HWMON
> > +	bool "LSI MPT Fusion SAS hwmon support"
> > +	depends on SCSI_MPT3SAS && HWMON
> > +	depends on !(SCSI_MPT3SAS=y && HWMON=m)
> > +	help
> > +	Say Y here to expose the IOC and board temperature sensors of
> > +	LSI / Broadcom SAS HBAs (such as the 9300, 9400, and 9500 series)
> > +	through hwmon. See Documentation/hwmon/mpt3sas.rst for details.
> 
> This isn't a bug, but the help text references a documentation file that
> doesn't seem to be included in this patch. Is Documentation/hwmon/mpt3sas.rst
> missing from this commit, or was this added in a separate patch series?

I forgot to remove this sentence after dropping the documentation. I
will do it in v3.
