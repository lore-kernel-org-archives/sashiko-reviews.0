Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B1D4A2E21
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 19:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734833; cv=none; b=ISYcLgPfEh5M16NLE5S67zQsefFKlPcxoce2lOkjrjuBSWF3asRDK0WOtk+W47GcUgiFkBBsR23C7g0PUHhLmax8e+4z0YBHn6SC99RKUQRC6rJ4V+l83UxK+8Th/3TJtx0K1sMQ+LmuwrTPj71o+u2ayBSE2+Jo+vK5lA7KhkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734833; c=relaxed/simple;
	bh=/hRBCrnW8Gh3WW247a/00Ca6LW4xE6FDipjhpbexhOs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VGK7MeKrNBJBSjnTQgtTHpFgRJuwVpXiHasbfShrD+qLh64BAJRL+JEI+rLor3S+xpNM/RUYwebT6yupPPCI5hlvnZEAeJ2FDbUrk/8sn+fxZEZczbPN+cTr77g4b39DBBEeGy+N6+DK1Dx1LeTyzonVskGVos21dTcrszwYoOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Y5vNZjpX; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Y5vNZjpX"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceaf8a1265so20865125ad.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 12:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1786734827; x=1787339627; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CkCO8GlMITy4YSr7V6q1rXobtNDejLvp1V+0zJdP38Q=;
        b=Y5vNZjpX6bErXs/L2/ILVLW+vyZBLpgFW9NyuZgzvWeYTSoxqpXkd541jrXMkh6GNp
         Lvv2zXX8CPAP9ZtjwnEW8Z/zRL/vlvSZLa9awuK626dew/B7JV+hog36kdt0nuDnOtNg
         vlql9bKLM2AQE9NFQ+X/0q2Ax3Kw0wKU4Q0OEO3X1NC/9bUE4CWKA+Sqf52VxqGLDq7u
         CjqwDCwJ3C5VB2UP582u3oPMQLJ0lqiamMYWSSWB5qxiZImLBH4WxX8FAeY8d3VVgr6l
         alWOFAMqho0ijJdVK3HFcXsKPpHlzHHi23ComwnT9nj0FWhmxVLHLDCbzHbJf8F8M4s/
         Jx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786734827; x=1787339627;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CkCO8GlMITy4YSr7V6q1rXobtNDejLvp1V+0zJdP38Q=;
        b=DntnUMwy5cFHsmomsIQWVQntf24FkFgC5u0Sq/Z99rfVxAvJJl5d2+tNwYMroLt5Lh
         ns++Ben6aYAnOd86qnye/qsuNdBKyH2tNqssio79Y5BsjNBrAyZYjVNqx8WVKCCwBAaW
         v7TSKtzzeWikZ9ErG1SQCyA0d/gYElSmz36BF5H0nICiqgta/NJPaNfh7ma2XCa0yE4g
         GXVKUC0l1ulWWryA6NNW2Be966emCihDNwPNXuoriLfZFDK0J9dSLkSlk285cX4EdBrH
         +aOrBs2+yXI2/jZYcoWvFpEq1rtqey8eN1k7dZkjnPXMV/1/ShABtZ5wxpumcvsNPQPa
         xkpw==
X-Forwarded-Encrypted: i=1; AHgh+RpNQG1+uLuxNvUHG48clJ03fbFpvPKf2X5XWQjTSWIQTGCRdguR/geOo7WC19oRNUNZEP+eNJVzPsmmPsiPJrQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0GW8mCiGzVmzn+SdZ48R26c0TkKvh8pIqKACnEOGdyvZOXj7/
	C0SbQXMOzBpIHn4eVWG3fNNAOJk575FJpqGC1OUycwrT6b5oYb8Wtbt7xlsuyjU0ODu4VGnBeL4
	pRDhsepc=
X-Gm-Gg: AR+sD12+LcKKAZS5oICT8L/z3kEoyVcWkagd5I1NndKdl+4f+0zE4fWTZuOD7wyOFs1
	7D0FxoSIauNd3qyj1AfjeL/SwOwrguYRlCwRS6Vx9JsJjJHI3+rU5+hACSuY3hRiTLVfMaD4C+z
	PBVdulHjdbAbmL6ib+wqZStCXgDsHeEeKn1xCdF9qRpR2i8iACle3mjQ2jnRQVLRLv3hfx53TKj
	uP+iY/Vkb3wcGauRJ05lqfN4kPufWdETIlFVH/rjolqByz/G10tzMhzw+jy6Rjnj+PfawDU49a9
	hzaAQzaxekKQ4ndrIXnM2S2OZAUaRrRM28jmqP7nlsznDAzrX+64GBYj7lZS/0O/2z9S0lKWAzz
	VW7UgKcHJKoUs9OM7aQOYQIeQ6WP3AN7w6vUqDrEPJtS/QunnSl7FGUkS2sI5JwdsecGYj7HkGY
	f1q8We2gSwMrIMpoqGzHHqlpNAbS/ZoybfcsXE/6KY/x9o+JqQTxlZ0yN8me/0kB4srg==
X-Received: by 2002:a05:6a20:93a0:b0:3b4:8f18:33a with SMTP id adf61e73a8af0-3cc71ac3815mr11249965637.1.1786734827398;
        Fri, 14 Aug 2026 12:13:47 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413889bca5sm16915474c88.12.2026.08.14.12.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 12:13:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Aug 2026 12:13:45 -0700
Message-Id: <DKOWMVJ31OP8.KS5H56DT4YUE@nexthop.ai>
Cc: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>, <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH] of: property: add i2c-parent to fw_devlink supplier
 bindings
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Rob Herring" <robh@kernel.org>, <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260813-b4-of-property-add-i2c-parent-v1-1-a2487e920ce1@nexthop.ai> <20260814010950.051261F000E9@smtp.kernel.org> <20260814181510.GH1981719-robh@kernel.org>
In-Reply-To: <20260814181510.GH1981719-robh@kernel.org>

On Fri Aug 14, 2026 at 11:15 AM PDT, Rob Herring wrote:
> On Fri, Aug 14, 2026 at 01:09:49AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
>> - [High] fw_devlink incorrectly parses I2C slave addresses as phandles d=
ue to 0-cell supplier binding definition for `i2c-parent`.
>> --
>>=20
>> --- Patch [1]: [PATCH] of: property: add i2c-parent to fw_devlink suppli=
er bindings ---
>> commit 85f34a66eac871d9e36bccb6795b94b17ab065d4
>> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>>=20
>> of: property: add i2c-parent to fw_devlink supplier bindings
>>=20
>> This commit teaches fw_devlink about i2c-parent so the core creates the
>> corresponding device links. This ensures consumers are unbound before th=
e
>> parent adapter's device, removing the need for -EPROBE_DEFER.
>>=20
>> > diff --git a/drivers/of/property.c b/drivers/of/property.c
>> > --- a/drivers/of/property.c
>> > +++ b/drivers/of/property.c
>> > @@ -1409,6 +1409,7 @@ DEFINE_SIMPLE_PROP(resets, "resets", "#reset-cel=
ls")
>> >  DEFINE_SIMPLE_PROP(leds, "leds", NULL)
>> >  DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
>> >  DEFINE_SIMPLE_PROP(panel, "panel", NULL)
>> > +DEFINE_SIMPLE_PROP(i2c_parent, "i2c-parent", NULL)
>>=20
>> [Severity: High]
>> Will this correctly handle device tree bindings where the i2c-parent
>> property includes a slave address argument?
>>=20
>> For example, platforms using devices like the Toshiba TC9563 PCIe switch
>> might use a property such as: i2c-parent =3D <&qup_i2c 0x77>;
>>=20
>> By passing NULL as the cells argument to DEFINE_SIMPLE_PROP(), the parse=
r
>> assumes a 0-cell list. When fw_devlink iterates over the property, it fi=
nds
>> the first phandle correctly, but won't it erroneously interpret the slav=
e
>> address argument (0x77 / 119) as a second, independent 0-cell phandle?
>>=20
>> If another unrelated device tree node happens to match this phandle ID,
>> could this cause fw_devlink to link the consumer to the wrong device,
>> potentially leading to spurious probe deferrals or circular dependencies=
?
>
> I think you need custom parsing for this one to read the first cell and=
=20
> ignore the 2nd cell if present.
>
> Rob

Agreed. One wrinkle with unconditionally ignoring everything after the
first phandle: i2c-demux-pinctrl holds a list of several bare phandles
(i2c-parent =3D <&iic2>, <&i2c2>, <&gpioi2c2>;), and in the flattened
tree that's indistinguishable from tc9563's <phandle addr> form. So
always stopping at entry 0 would silently drop the demux's remaining
supplier links.

The only reliable disambiguator I found is the consumer's compatible =E2=80=
=94
toshiba,tc9563 is the one binding with a trailing slave-address cell.
I have this queued for v2:

static struct device_node *parse_i2c_parent(struct device_node *np,
                                          const char *prop_name, int index)
{
      if (strcmp(prop_name, "i2c-parent"))
              return NULL;

      /* toshiba,tc9563 is <phandle addr>; every other user is bare phandle=
s */
      if (of_device_is_compatible(np, "toshiba,tc9563")) {
              if (index)
                      return NULL;
              return of_parse_phandle(np, prop_name, 0);
      }

      return of_parse_phandle(np, prop_name, index);
}

Is a compatible check in property.c acceptable here, or would you
rather see something else (e.g. entry 0 only, accepting the lost demux
links)? If this looks fine I'll send it as v2.

Thanks,
Abdurrahman
