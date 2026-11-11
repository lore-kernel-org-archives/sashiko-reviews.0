Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794392828;
	b=Tt37BJsD8Kh6687ZbNZbViPoItJpZYhZjZGUJN8z9ZxlCCBpJCWQaqXqxftFJImX+fA4
	 Fv5KhaU0WxGqeQw8+JYObEtf5IrEXhTzQmPr1gz7ImWkPKMdbmodUHZqCyH08XX9fpTgj
	 0FblcnayP4heoXAMlhVHTkRPob6/LzP8HEPotGazqR1/gGJVa+zExpygA4qgEvV6iWgby
	 oWrY1KdJIheOZmHyaIigZi1wQnNXibiXRLbY7s3Dh1ukbmQk5BMadNZu3I1yeg8T9fjoJ
	 F7JxzyofLlk15OMH5Um6Vu1tpPEN4wNYxngaQ23IPW9AgNSVyYuBD8W795v51VSCOYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392828;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Organization:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-ZohoMailClient;
	bh=izBfG5NYxgsrXHkibSx3HWmcn07W3wT6ndQmqom6GNQ=;
	b=lEH6v+iJFQ35pBazEmTs5ro+tsClpYzD6eXjsZqW7xqfqWtDwuLeVQqpFHgR2jmPALqe
	 w9VKvqCoibrbw7vCQ+755Zmn9slMl1WD+U4QADCZ1FvBn5ayFDh1OrxcfwuIPpLmehgoy
	 UWFBvpcfXNLu31+05rmj7XqIzKa89HQO45OMwTwi05TA8vov6mVrKTA4uGIlhpKY0PNH7
	 2OVxta2UbCOC7DdTJXV7XW/mu///GAGlc83sLLJpY/LMbkRbx2lX7sxIHRGhvlPTdCiF4
	 O8ENKTbHN0TSi3x+E6epYxx3FBD/c0Jc0QF8JTF11PwGjpnMt2QUu1uyOkLlSvoAjMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icenowy.me;
	spf=pass smtp.mailfrom=icenowy.me;
	dkim=pass header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b=J9OSvhXi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.12
Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D781B606A324
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 10:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D781B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b=J9OSvhXi
ARC-Seal: i=1; a=rsa-sha256; t=1794392820; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X/HX67F92GhFRj7qyinZmwx/H96yrqVKh3qzZ20sgUcU7Bq1EzlL4LwKbanj16DaHIeAsfl1B+qcOUKXcizeVDto7mVnyPeb9dgTMese2SySaXW1ka1t9lhlN5Y+3CSRxekdfQgYz+oHyMlLSu0jRqR//hXS8AZbXWHAvWjoI0M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794392820; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=izBfG5NYxgsrXHkibSx3HWmcn07W3wT6ndQmqom6GNQ=; 
	b=fwDqvphywJ3uYhLeRoF5hlcNDhVwtmYKj+nvlJei0yPlkZDg9A4tiAZKXH69aS5hneBpcZfV9cMpkqr9nOp23zSTyrLLRrN8YEby+YjzvNa3APgIz0pqTH/UC1hjuQV87+GimXIrKW594bKrR5Vbi3pkoloHftpi0cIplmKMhfc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: a=rsa-sha256; b=J9OSvhXiOr8lL3EQgkc/e/NNi3TnxQ3XlcIW5iQ8G8O4YIpzmpfsofd64NZF96sK6sewXhziyjoWP4mrKydKsJxgtjUpg2plbX4qatreUxLCiOELTmxBkVvc01H9QyYa6GM54yi/P/dU+zcWbFQIIN633UnCFgJ4GRxBmIgIc3mpxEXXdNxdsf74Nvk+CH7nUy6EL5EwtTsi9ih7WxFgsjBDvLUaN3jnfb+Vxy/NmmLDgKgqeJEk11+N8VYRGRJRlQMUh/809aREBoWNb3QBbvydxClqopz9L0FHDHbTFBwP/IGHUIFYf/LnxVdk2xdAxDAeih67xe8Q+Pa5XczMgw==; c=relaxed/relaxed; s=zmail2; d=icenowy.me; v=1; bh=izBfG5NYxgsrXHkibSx3HWmcn07W3wT6ndQmqom6GNQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794392818762580.4241612026577;
	Wed, 11 Nov 2026 02:26:58 -0800 (PST)
Message-ID: <68b5a51d767248a71c050110d5faf6c50c964d50.camel@icenowy.me>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: panel: ilitek, ili9488:
 make the port optional
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>, Romain TISSERAND
	 <romain.tisserand@gmail.com>
Cc: Igor Reznichenko <igor@reznichenko.net>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, 	dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 sashiko-reviews@lists.linux.dev
Date: Wed, 11 Nov 2026 18:26:51 +0800
In-Reply-To: <20261110-comical-adder-from-saturn-8c8fbb@quoll>
References: <20261109160706.2272332-1-romain.tisserand@gmail.com>
	 <20261109160706.2272332-2-romain.tisserand@gmail.com>
	 <20261110-comical-adder-from-saturn-8c8fbb@quoll>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2026-11-10=E4=BA=8C=E7=9A=84 13:00 +0100=EF=BC=8CKrzysztof Kozlow=
ski=E5=86=99=E9=81=93=EF=BC=9A
> On Mon, Nov 09, 2026 at 05:07:04PM +0100, Romain TISSERAND wrote:
> > The panel is a MIPI-DSI peripheral, a child node of its DSI host,
> > and the
> > driver does not use a graph port. A port is only needed when the
> > host
> > links its panel through the graph; other DSI hosts, such as the
> > Allwinner
> > sun6i-a31-mipi-dsi one, link the child node and have no output port
> > to
> > point at. The PinePhone panel is described that way on the same
> > host,
> > without a port.
> >=20
> > Keep the port allowed (panel-common) but no longer required, as for
> > other
> > DSI panels such as ilitek,ili9881c.
>=20
> ilitek,ili7807s and a few others have the same and it is confusing.
> The
> port should be required when this is connected over SPI or I2C, but
> not
> for MIPI DSI. I think that for MIPI DSI port is meaningless so
> actually
> incorrect.

I found that the dw-mipi-dsi common code (e.g. on Rockchip SoCs with
dw_mipi_dsi-rockchip) would expect the panel to be connected via a port
even if it's the child node of the DSI controller.

Such an example is at arch/arm64/boot/dts/rockchip/rk3399-pinephone-
pro.dts .

Thanks,
Icenowy

>=20
> Why was it added in the first place?
>=20
> >=20
> > Reviewed-by: Igor Reznichenko <igor@reznichenko.net>
> > Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
> > ---
> > =C2=A0.../devicetree/bindings/display/panel/ilitek,ili9488.yaml=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > 1 -
> > =C2=A01 file changed, 1 deletion(-)
>=20
> Reviewed-by: Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
>=20
> Best regards,
> Krzysztof
