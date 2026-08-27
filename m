Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F993451A6
	for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 20:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862776; cv=none; b=tKTh7TajDIewt8wkwl9OxZT5V/8CC4bByzg+r/QPAey0CjEYhaWmbagNIJ90QbY+kTJT6AUjlI5GCACSbrlyR8Jop9opOB5gaeHS0reB3icxkSZfiQ5D+PFNr04cmIQm6K19eLOwbO1MzzNEkCfSb5WJZaHwe+HBkJky+ORCnKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862776; c=relaxed/simple;
	bh=82O/YXc1v2WRinht8WiUbNPQnVBDveS5luAPPYcwvFQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HZ4jpWp/MSDiANYtrxaGvWZraLNxEVlL+2ZP0USg6F3McgWhrdEoiZlXLIKjBAVVGEiS0zSPfsVzAw+WnFP9GWrJQsfRv31NqCFIY7X7zf4+naAFeM9iZp+4m+NYZEmREDi+Kj1SdsV0N7CZk6zBII3ifO8RcD/aeElm+pp5U4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=juV+jAhr; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="juV+jAhr"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca80d708489so160066a12.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 13:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1787862771; x=1788467571; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mz/K4jXj/5XRF5Ax4Mze0yfRFKcTTEx1l4BSrYQZC+A=;
        b=juV+jAhrUhlgS7CTIBv+wTlSYvOP/B9ItkUFWru6szFQKEs18k3p/C8hZUo5HPg2py
         vaLwE+zcceiC/xypi7AXIhvqKoKUcmAnCH/rZ3BfoPxnRi2DY79ta1hNMpHpQKMzxTNh
         jvY6CWyDH70psxtOVPIAiNX2DbLP/h6y1kw8PjjagKhzZOMrxQHrnuL/WlqiQQQV87rM
         uq6vvcbHRLZpJyRWnRwJPYcQce457B57T44KE5SkEi2ZL6i/NIrnrAlvNJuqX1H1LxML
         3sZNg0gWSd1wqRRmZPCLbg7cpk4WR2f1ptcgjDXXtuH0NNyuOJzKz+7jfd6gl3adhW3q
         b7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787862771; x=1788467571;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mz/K4jXj/5XRF5Ax4Mze0yfRFKcTTEx1l4BSrYQZC+A=;
        b=VQ9my5TcTX8vrLw/xm91/VY/76YxAHtPHrMjCgkCfZ3VYdJlQEoaQ2PAQs5qnHTIqy
         Lo14GYOHhtF/RktWRz8F15YlZEpNo/HBYCj0Ebfu0FHWuAz830Kq8U3XMubdVwpIVaKD
         Fb9HPVUi+WB53Bh+okiSBzm75kIwBgIuMyP+0wnqATfmsgqDGvT3Sv3VjO147jgmZoGD
         T58x8psH7NgXJDBobOUeT4dlbsmsl6t5HP7DSbinh37FqnPPDn3aR2hGrvKuy17UTt+e
         5eQ/a7uTmQnAkf8sQDFA0XSxaQJhf3kj46Offi5XolMXKqjBWIfiW9BO670ptx2U0OpM
         GkTQ==
X-Gm-Message-State: AFuF++ncX3JO7aYCjn6uoKpaZQ4hV6b83YHvDoV+6dVALNCBMB4Bq/n1
	7uHLmO7gGT4a40YBAUiN2C7/uNT6dpVt+ywuSdxBzmgWAxhV8P8H2XJ8Vgw/ZHmcstZ/zYe8J0R
	PPoTwSmk=
X-Gm-Gg: AR+sD11sybz3SLt96at+iCoCqQ5ERzEgoPSTlagUKJ20tyop/4Hm8JnJ2axZ9JMCzLF
	jBNXnOscFNedt7pWpThUd27AxglqmGkMQ8QTynmgAkcMv9PwQ8Ar9BWyDCFmfP7NLv/0yT8c8vJ
	XPJluBmPLGr7vAvma9DFob1i84XOXOEy5Cfov0XH/AidiWBoLIxkT3PuIhDVB6RwLrY/sIgQ1iV
	BtvC38/h6/+80FTTlaPu+df/yyFnGGYNQ69SjnciG/7MJWbZHUZZl0z/Kri85p5krQx4aYogTfm
	5WIN/YMxTJpIEbd0WqL5Ka5tF/uLVTk9E0qvckBsAvJHd039gfYrhHKc5ugeakRDMCGtxBrD8VK
	6cr6nVFDYKuZldsTbAwuJArBVFc7jFCPeYhkObCxkv/8RMW38i/A4IaU1o9/eDv5bo8ei8R/tX/
	v5hLbCLmiPFCEw+S4L+0fdkJ36MV3i9mUtbf5ZrXTZ2W4XYKV3Yf6569ZvooZc
X-Received: by 2002:a05:6a20:7343:b0:3bf:9bd9:cf60 with SMTP id adf61e73a8af0-3d0f4ec12f9mr11171456637.6.1787862770590;
        Thu, 27 Aug 2026 13:32:50 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c291sm34724983eec.6.2026.08.27.13.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 13:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 13:32:49 -0700
Message-Id: <DL00GHMO5NLQ.KX1IN5A9UFPG@nexthop.ai>
Cc: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH v6 04/10] of/overlay: look up absolute target-paths
 absolutely
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: <sashiko-reviews@lists.linux.dev>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
 <20260805-nh-of-alias-overlay-v6-4-74f21d440819@nexthop.ai>
 <20260805204009.CF3891F000E9@smtp.kernel.org>
In-Reply-To: <20260805204009.CF3891F000E9@smtp.kernel.org>

On Wed Aug 5, 2026 at 1:40 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Medium] Pre-existing memory leak of target and overlay device node ref=
erences occurs on the error paths of `init_overlay_changeset()`.
> --
>
> --- Patch [4]: [PATCH v6 04/10] of/overlay: look up absolute target-paths=
 absolutely ---
> commit 28d3c18ff8d649fd8af8d895999493b24c338fa1
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
> of/overlay: look up absolute target-paths absolutely
>
> This commit updates find_target() to resolve non-empty target-path proper=
ties
> as absolute paths from the live-tree root rather than appending them to t=
he
> target base. Empty target-path values still resolve to the target base it=
self.
> The documentation for init_overlay_changeset() and of_overlay_apply() is
> updated to reflect this new behavior.
>
>> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
>> index 08d5351746be6..74aea704835ac 100644
>> --- a/drivers/of/overlay.c
>> +++ b/drivers/of/overlay.c
>
> [ ... ]
>
>> @@ -737,7 +731,9 @@ static struct device_node *find_target(const struct =
device_node *info_node,
>>  /**
>>   * init_overlay_changeset() - initialize overlay changeset from overlay=
 tree
>>   * @ovcs:		Overlay changeset to build
>> - * @target_base:	Point to the target node to apply overlay
>> + * @target_base:	Target for fragments with an empty "target-path";
>> + *			fragments with a non-empty "target-path" resolve
>> + *			absolutely and ignore @target_base
>>   *
>>   * Initialize @ovcs.  Populate @ovcs->fragments with node information f=
rom
>>   * the top level of @overlay_root.  The relevant top level nodes are th=
e
>
> [Severity: Medium]
> This is a pre-existing issue, but does init_overlay_changeset() leak
> device node references when an error occurs during fragment processing?
>
> Looking at init_overlay_changeset(), if find_target() fails (or if the
> __symbols__ target is missing), it jumps to err_out without updating
> ovcs->count:
>
> 		fragment->target =3D find_target(node, target_base);
> 		if (!fragment->target) {
> 			of_node_put(fragment->overlay);
> 			ret =3D -EINVAL;
> 			of_node_put(node);
> 			goto err_out;
> 		}
>
> Because ovcs->count is only updated to the successfully processed count
> at the very end of the function, it remains 0 during the error return.
>
> When the caller subsequently runs free_overlay_changeset() to clean up th=
e
> partially initialized changeset, its cleanup loop is skipped entirely bec=
ause
> ovcs->count is 0:
>
> 	for (i =3D 0; i < ovcs->count; i++) {
> 		of_node_put(ovcs->fragments[i].target);
> 		of_node_put(ovcs->fragments[i].overlay);
> 	}
>
> Would this permanently leak the node references for any fragments that we=
re
> successfully processed before the failure occurred?

Confirmed: if find_target() fails at fragment N, the target and overlay
references of fragments 0..N-1 leak; free_overlay_changeset() never
sees them. Something like:

 err_out:
      pr_err("%s() failed, ret =3D %d\n", __func__, ret);
+     /* let free_overlay_changeset() put the fragments set up so far */
+     if (ovcs->fragments)
+             ovcs->count =3D cnt;
      return ret;

(guarded because on the kzalloc failure path cnt still holds the
counting-pass total while ovcs->fragments is NULL; everywhere else cnt
only counts fully-initialized fragments)

Rob, would you take this as one more patch in v7? The series already
touches init_overlay_changeset()/find_target() in patches 4 and 7.

Thanks,
Abdurrahman
