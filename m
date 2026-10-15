Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A633E3C4F;
	Thu, 15 Oct 2026 03:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033523; cv=none; b=iq6UQw3+jTg7d0HfaWcxWBuTfhIjB3OIvWig+jLjPLKv3FXrESXHF8dgEtlloYCuz3DZymKhhlCcyYv3vFMkYIYSACpXYt8FkVcvUhF9X50Etdd2nJcvDyexV4I+hsxUvbNAN8TxgP5uQ7lE01gbyapqAQPPP93i+nh+Uwp6hIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033523; c=relaxed/simple;
	bh=1F2/8Qoi+ZLRSLNu9c4URkV62a+R1n+aRXYPBgJ5WYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tenMdnJ7QCKqSIvy7DJ1eyeG6QC4Q4XidCsZet8w3oCWfDHdK5Kq0gbFwCHnil75z3U9GODLXkPORiT3fz7M7EJPxOWhYF4SDH4iCg25QPtrqro7Pb9OFoGRr9dnMp9o8YB0JYjaXchOwDNt38AqpvpTw9uy8tJL01FvsZN1iGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbnyUnjT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbnyUnjT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC0E1F000C4;
	Thu, 15 Oct 2026 03:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792033513;
	bh=PnjZw2FhXq+q+owUi/YhDuk0hZ3ZixizYTEG0j3X6To=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hbnyUnjTslwyNtTfnmKPdE7+/n48Kmn/wFF0Gyhleh5ZfLm+poD37159AGbQFi2O9
	 XqM6CrU0Ubgn1KUlnjwe9s/IqhM3Wri6/NI2yiSqG5yGTrHZ2pqcMfJ+KyqyyZILux
	 41MNCNTwXeKWE+Gp3fdqTbsslR9Z+t8cetR8ywWWg75sxRdq6Oh66NVVQYcYne/pWI
	 csnh3QFqgdvaIJyEf38eJpllkT3TZsnC1kXRI/a2QrxxVzewTAmFmwPzhMkaTWnHab
	 uETF3hU4LeUkmYmUzSMJkTUSpt3f6mSkYw/JXVVKZOgPhlScwFjDgoOPytu25qA6Yb
	 qq3isBhMW5gog==
Date: Wed, 14 Oct 2026 22:05:10 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: platform: introduce EC for Dell XPS
 13 9345
Message-ID: <20261015030510.GA282943-robh@kernel.org>
References: <20261011-dell-xps-9345-ec-v5-0-2ab1258b84c1@vinarskis.com>
 <20261011-dell-xps-9345-ec-v5-1-2ab1258b84c1@vinarskis.com>
 <sashiko-outbox-167353@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-167353@kernel.org>

On Sun, Oct 11, 2026 at 05:37:21PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: architecture-specific header included in yaml example
> --
> 
> commit 8b45bf401f436a6e8330c0e4539c0d77e9e73400
> Author: Aleksandrs Vinarskis <alex@vinarskis.com>
> 
> dt-bindings: platform: introduce EC for Dell XPS 13 9345
> 
> Add bindings for the Embedded Controller in the Dell XPS 13 9345. It defines
> properties for thermal and power management over multiple i2c busses.
> 
> > diff --git a/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
> > new file mode 100644
> > index 0000000000000..3485117b505cc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
> 
> [ ... ]
> 
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <arm64/qcom/qcom-adc5-gen3.h>
> 
> [Severity: Low]
> Does this example include an architecture-specific header? Including headers
> outside of include/dt-bindings/ breaks dt-binding schema portability rules.

Yeah, please don't use arch headers in examples.

Rob
