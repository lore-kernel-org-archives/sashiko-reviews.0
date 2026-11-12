Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491877;
	b=vDc2dDIYGx2CkE/ZYgf21rBAQAsbFdn4MwaM/Pa1N4dpx1AtFNZCfJ/M0Hqbck12qKGC
	 0c/dHMcPUNxkNcn2pbddE4s5Z1GV8jvW2rtk8O6LEaSPjq4uSttJaTsSAScV31vZtEsHT
	 KxqTEElEtBWaey4Bl8OoP4IfceFQRG7L7CYGmL82IfCbJza+u/qwtolwf+t//3bu8JYZD
	 WryUTzcRaLBXldmzg5/aA9vzEFd9ys8BkEuXBCLSMwYBo77BHc1dyqh7Kj7NX7/mNDFyZ
	 9U3OlL6sbLp9WTIAURZkS16OHcaaGObT05jdtNRLPb28kcROZhAJEioDF7kc2CcW4GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491877;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=f3ykWZmQ/f45/Zpj/jNthXvkHOJDjIn+aYOoUY4EbyM=;
	b=0voyougzespaGDi9ZJteF377bG9BYzUx6kcD1diQM5koMqp56xX83WBwcncGU6rQ09mQ
	 zlrtVkfIu9Y5y4s8+GOqCQ4fJKZDiUMq23F0/jnqD5AfIVSFd8XwrzQQ38iTSin//4Xkj
	 gzUaAEyWvBiDOOnq0zQbugRgm9jjvOYuNMyt4ogWREujwsfqOPxPPdKFv0aXzAmSWNHXY
	 TrK+Y8lX9TyN7fGFbv1RWCdj+IxpvRP135e//1/ggpXogfdaFMzF9s2fppV0Fh4IChKS2
	 bwGixHBH8ylVP/1Cf+L33nvcQOQfsl5tHD8Hsvl5dGUQdZN5cCzwhGedmMemFMtMXSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJwMaXKs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49743606A32A;
	Thu, 12 Nov 2026 13:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJwMaXKs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3DC1F00A08;
	Thu, 12 Nov 2026 13:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794491876;
	bh=f3ykWZmQ/f45/Zpj/jNthXvkHOJDjIn+aYOoUY4EbyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bJwMaXKsDdol3iNeGT4r5kAIJWX23dIeo4sKdKD/m4Q9bq2RlsOd6tRuhoXdKAsIb
	 NHthDolwbMfoO7ufO6nc+rbFonDtYrDG6I6ZdlGyqVjeNnmEGb9pqblyTqiWCob5zp
	 c9zZeNTYCiQc7dFeDC0pj7jLyDYshSpn4kvQLLwCBlqhYji9zOTM7MBS8rEyei62ia
	 Z+yzdiU7ZTUVilHxae5pvnXW4+o/pUGLN7wgctos088IYHEXKRUyLJouu9WQJyFUE9
	 R4P2UDt2UHuiqraSoIFTauLP/kv7nU5FrGKNKe55t+pqmInSs95tCOShi3bXSbxJKA
	 Ie/4HstAPbt2w==
Date: Thu, 12 Nov 2026 07:57:54 -0600
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Bhargav Joshi <j.bhargav.u@gmail.com>, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: arm: omap-l3-noc: Convert to DT
 schema
Message-ID: <20261112135754.GA340903-robh@kernel.org>
References: <20261109-ti-l3-noc-v2-0-509e8485a1f3@gmail.com>
 <20261109-ti-l3-noc-v2-2-509e8485a1f3@gmail.com>
 <sashiko-outbox-203987@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-203987@kernel.org>

On Sun, Nov 08, 2026 at 07:40:41PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Low] dt-bindings: bus: ti,omap-l3-noc: split omap3-l3-smx into
>   separate schema
> - [Low] dt-bindings: bus: ti,omap-l3-noc: restrict ti,dra7-l3-noc reg to
>   2 items
> - [Low] dt-bindings: bus: ti,omap-l3-noc: fix property ordering in
>   schema and example

These all appear valid to me.

Rob
