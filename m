Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E521339022E
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 15:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820042; cv=none; b=INExhX5uT/QV2An87421R+1TerjhKHTZoHInT6gfBNygwoLvnIERzKN/jX+XiuL2F96P08hYz/cOe75lbkk08pB0IpZPVaz5g7Eo1/yAhfSr5xuZoJmSvvS1agbF1Ha4DqByAezZF5Uy01vXlloRkEzMr6CUjyPgpIITdUYb4GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820042; c=relaxed/simple;
	bh=gg3v6Zu7CS0roSzZxbxDcfm+QoLt6swDhD+BPAtEzBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkYWKbCiUx9v27khjZxDPf3GnOYt75yXKjpw/Ij8ZNPJhreTK8WJqVaoaomtcXfTm9Pi+SBsgvY0r0oM9ybiNqaNqPY4iTn0gSaAyYLZB3ZMbyYD6p/GIUIiv7rI+s7iDr4JJ1shvToebCEFz8rEk1ocTCSVFcuf7NU6bSjeZsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQ3uh/oW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQ3uh/oW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E69D1F0089B;
	Mon, 12 Oct 2026 15:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791820041;
	bh=tLHUTormw7i88mv9EGIlHHpt/mJ5WU9EyhPCn8+LmvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hQ3uh/oWoraIzUuGdH7mOgj2uWc4X68WFMaSsINwc17q26uUqWAa/djYDrrqTPOqJ
	 CkdFmr7/PgnH5y8MLr5AjXyYzhXaETd4zzV/xfL0Wy2RxoQ+dvrTdRBZwrXDEgN5sU
	 QvjP8wsXEBHiNcttj5MEr2L2y5g6d1GabVVTlvVU8h5GKAoQgyE1HcTMTuL89BkFxw
	 u9uzc9D3LhOdH6Uqtjl7tu7OtDTzvRuwF8egTYo0UQ6aLAeg1zIkfgy5mLFnO1S3xH
	 cITA8pRHCKhe/1L0M0ykNhclMQwi0r7F6qZXeNw+WQdihTdPx9Fv4BQCy4FTYLweHw
	 ZeRuUO7MTQr+A==
Date: Mon, 12 Oct 2026 21:17:14 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Oleg Keri <okerixx@gmail.com>, sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, neil.armstrong@linaro.org, 
	olteanv@gmail.com, vkoul@kernel.org
Subject: Re: [PATCH v3 2/2] phy: qcom: qmp-combo: check qmp_combo_com_init()
 in the typec callbacks
Message-ID: <as0A5HpetS75fJrO@debian>
References: <20260916133814.3977-1-okerixx@gmail.com>
 <20260916133814.3977-3-okerixx@gmail.com>
 <20260916135026.AE6401F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916135026.AE6401F000FF@smtp.kernel.org>

On Wed, Sep 16, 2026 at 01:50:26PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] phy: qmp-combo: unclocked MMIO access on teardown or retry after init failure
> - [Medium] phy: qmp-combo: double disable of clocks and regulators on retry

Please take a look at these two issues.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
