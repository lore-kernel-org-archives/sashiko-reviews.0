Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15E72D0C63;
	Tue, 28 Jul 2026 21:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785272892; cv=none; b=DPOthQA09sGrsCGZbTHOydq6CxsqsnRuozpqwJ2BuytmWo33uZNzfcFmZx3SIc1riDTAV1gGBqqb1fSI4Tnib/PfFSV1ewWvMjEyNq76e1iIvmZF23828yj/eQAWL25mGuhlfmKFcunZVkoHoTyz3tOMoGNqpfp5HoZu/vgU0y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785272892; c=relaxed/simple;
	bh=RaaC+GF2A49IjCXZ12/fM4p2r1Nrmg/03XNW1S/Tsd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIhURb5osezgl4iUVWSceFBRjBbJCig2MdBWtk/H+T8tBmckferuW/N0fZL1xr9/MsLUrEHP/n6CqwyPl0uZDpgZ8y3Ve3BWSknQ2trG32+XtOGS+OOFSfwoT4wHxh09yk2NnzqHEro/9y2Uim0cd39uMtN+Rz4IxPQQAu8F6DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5kz8OV4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5kz8OV4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FF81F000E9;
	Tue, 28 Jul 2026 21:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785272891;
	bh=LPD3vftpA1RxTfNr7o7PVynVjZyebX8OkuRakP1/rOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O5kz8OV4r3stpc1BEMsvSsrwYEyOPGYMHukc1ewdwQxh7rNgGlbIOUQG5yONDFnH7
	 0HPnSlt6fiINOivz29iP6phXWkvTvHPYCBLQ1hoNA98JPaDWlUV3BKh6j6cK2SnhbD
	 JEikiPLdQg/KgouyV1F9SZY8l1a/oUtTzd2T2jBd3B4GD+d2lfen474tkyFNd6Uvg3
	 tNEzgiKy1giN6kJe9ant+M/COEm+PCdmIxUL7pTSSpdxzhBHJsUsMN5m2FcXZr+Ovk
	 VaIj3sXitpgoNK/z7JPUndFQ9S/gd3eIuhT7iC3LbnpZQeCVzMZdNyJ+r+ZYI+qa56
	 F1mNqQnEOLJMw==
Date: Tue, 28 Jul 2026 14:08:10 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: sashiko-reviews@lists.linux.dev, vkoul@kernel.org, conor+dt@kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	robh@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: add binding for T-Head TH1520
 USB PHY
Message-ID: <amkaOo9mkjJfDNsf@x1>
References: <20260723084316.3573714-1-zhengxingda@iscas.ac.cn>
 <20260723084316.3573714-2-zhengxingda@iscas.ac.cn>
 <20260723084759.3BBF81F000E9@smtp.kernel.org>
 <8c2d675115b25107bf463cbbb6a377f80c46e592.camel@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c2d675115b25107bf463cbbb6a377f80c46e592.camel@iscas.ac.cn>

On Thu, Jul 23, 2026 at 10:09:48PM +0800, Icenowy Zheng wrote:
> 在 2026-07-23四的 08:47 +0000，sashiko-bot@kernel.org写道：
> > Thank you for your contribution! Sashiko AI review found 2 potential
> > issue(s) to consider:
> > - [Medium] The 'reg' property is omitted from the 'required' list for
> > a memory-mapped PHY.
> > - [Medium] The 'avdd33-usb3-supply' is omitted from the 'required'
> > list based on software limitations rather than hardware description.
> 
> BTW the power rail is expected to be always on at least according to
> the schematics of multiple boards, as mentioned in the next patch.
> 
> Thanks,
> Icenowy

That makes sense for the supply. However, I think the earlier point
about 'reg' property is probably valid. Woudln't all users of this
compatible need the base address?

Thanks,
Drew
