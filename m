Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F403A39524D
	for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 10:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782385012; cv=none; b=bGqUCRtWzai9qQlm3gmb9G+4e8BHyh4G/aio63pUjRXEwvEuoGNeU3f5PBrJ7CiQcpdfNHGKesovl33AuLe1xnkU3wDkFiKh0WYbgQO9nZVdOb26xKRJtQmCicmhoeTgTeowduZd8P37LNoIfEvPgp/og9Mq4XlNDzcC1Tc7NWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782385012; c=relaxed/simple;
	bh=haLRd/7iK2UAWm9b/wOf0VERYgLg/GM/K5+HuVZsoYw=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=rFYJes8L6bL+Y9E5qO4sqr4fzVdpgEGtPUH1vzvfJoz+VZ64PtN3U4wsdobBnMU5rH1/OawUygi61ei/7LttSOLazBsaetYBLD8nLAJJQytNLP48hrYetG54bLL2/Ni1E/J5vH8uMQQ97oJzOeaIbaHUv3uBT03KxUEmUJfFKdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZuHnXTB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZuHnXTB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 149181F000E9;
	Thu, 25 Jun 2026 10:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782385011;
	bh=haLRd/7iK2UAWm9b/wOf0VERYgLg/GM/K5+HuVZsoYw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=JZuHnXTBT1wZc5a4CjAWJQMMrL1I4sqeC8gBNzp9at7SKRvdGHL7Nd1md2qEEoS2i
	 JhJY/hTFlrloWmVdoB8MZ3DK4V/WYOdu+0U01wY78/nUFugTvZK8HNlJxUfAwHwCZE
	 Vq4P4G1sAesSwELuQe6Vd5/UeB+ar5y+v3vhylTgU0/T7jLg4c/4xZp/LcR7vjSsdR
	 4eLg80nEJwpNWTptj96LgXJ+GR5twqsLiDCM1qsfCfcXF7kWsBQvvNj646QCY+l3Dl
	 a90oDqQ+xkjLTPJrUxY0E0yRRE1REPAvZPxB8vNUCQjFq0iZlpsx3gEX22T0xFEJcU
	 qraEWBQmB5pWQ==
Message-ID: <bc7054cbee208f10518f50935602445f@kernel.org>
Date: Thu, 25 Jun 2026 10:56:48 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH v3 0/7] drm/sysfb: simpledrm: Various improvements
In-Reply-To: <20260625094509.157581-1-tzimmermann@suse.de>
References: <20260625094509.157581-1-tzimmermann@suse.de>
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org, javierm@redhat.com, jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, neil.armstrong@linaro.org, rayyan@ansari.sh, sashiko-reviews@lists.linux.dev, simona@ffwll.ch, treding@nvidia.com, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>

On Thu, 25 Jun 2026 11:39:32 +0200, Thomas Zimmermann wrote:
> Patches 1 to 5 improve validation of the values provided by the
> device firmware.
>=20
> Patches 6 and 7 improve support for panel orientation. There's a rotation
> property in the DT panel node. Read the value and set the connector's
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
