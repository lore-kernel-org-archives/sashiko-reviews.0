Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687233;
	b=2mBTW/DdXZHbbZREHQDUsLE+ol7aPtnFhrygDUaYbPFLHBJoSnoz0NiyUNLaZU7zg8k3
	 0+p7nuEea04JMkAi5hxcniEQfrSn1xzmxtSKbgvBbrzbSOfVFQiVNLEfYGptXgcWbCX6F
	 kXf2EYKWoyUQc/6RxigHQ43BSrPDLN8WemOVmlkEgs24xC4zsVde2nepOkD/BACCJmJTS
	 aJtH0Ty/K1LOjsFlWMwLMnFUYDOOmOoQfNwz/SLzXQnyrAC30xMYA1rZgksKL8yx5zDfC
	 ukxUhkJ4N6rcVk7lp3ASUgZrryAL5g0Wys9XammP4FRGb0TRJSDGhjfKmK9UOkFAG1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=KIXR/3+QUTDcEupkbOOsq++gF5QeeU/bfAuAJ1TSZ9Y=;
	b=zcB+RzzjC+oy9DuyLmxOKhqcAZxuQeMvfDk/jkRE/Fm5yxsNelpBSGsNG6doYuMm+SZ1
	 iKErbwR15hJkuP7FDAN4+NsXEa0mnxG8/eSNQPjzmwKGQnWwHwDXmxmilw0Zq+AHNWDhO
	 P/P2rZveJQhH99H8LdaFDDG/1UBnffWuXFAD8P3MA8WN39jInhuDcNIf7sv+PP8SW+l0U
	 Czt2mKQM8hHCoZY3g6kv1JEKE3Qwejzdg8n8PDHzgy2L5hH+4vczpVlm5yyOimB8kTR9q
	 eAAC4rzUg6VzIHXo98UCee8XZioVzRlhQFWaIvc6KDrXn+k7sLGUzwfifty6sPK5LZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=RHnQXCX7;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C1B606A31E
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 16:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6C1B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=RHnQXCX7
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c45551fa84eso313390966b.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 09:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792687231; x=1793292031; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KIXR/3+QUTDcEupkbOOsq++gF5QeeU/bfAuAJ1TSZ9Y=;
        b=RHnQXCX7TDq0SqzEg/X4WVKXGhZ41ZKyxWPRjuRnacl/BO8NNGTOBQrevI1UQfhBmb
         DPJiDIrlNMQN8uNBVtMtyvkqDZWeEvSTUpE+m/8qiRKPqGXjJIqricaoTIUddC66xm24
         6WLOurJMSOlrCCBATt/fWvZaJow0raXmlMNCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687231; x=1793292031;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIXR/3+QUTDcEupkbOOsq++gF5QeeU/bfAuAJ1TSZ9Y=;
        b=zNZP06YDAjeZ6JafxRkwDjtJGHySwg47Pl6sdac70Sl36Qe4HpirkGc8bDIoXPs4aR
         p4V7LqFdJxKosrIgKBj4SSMP5wPM1O36rgUsF+AXX3vVrMAW1D7s6Ln8HFVoGEnuErsn
         cg7GS809hpdERFVs2Z3gC10z8yQqhGJVDvF3Y2dNY08ywNIrkGUvPKqOlUXk6xS4PzsP
         eJI2u4qlyX66A6V6DKXIGab4qk1j5NbBGr26dSi0eSNygxKXyoG92xgbrm/kNKuAzlHR
         yIuZ14gch7cW/gGSoAYGaQ76BBC4CQGiEVJwZ+faV94gkuRnQdrt8+MRlKk4D/M97CDv
         Rs0A==
X-Gm-Message-State: AFq9FYJC4mAOdzoj0YvnKShHllVW11QTDVff6UZcGUq+ofxnKMi67dYJ
	X1hwbszRb+28eUS0eSIvu9W78VrLrEABq18p0/Y+dSyoQq5U5OpFVGtOPH3pCHGXOB8=
X-Gm-Gg: AYBFou09A41TOd5YI2HQCXGPFTtRM6I/C8u9g4EYWVAJylWFqu5/VI+bDWIAWKJp2s2
	171IaWCEreZE7I0dxq9niU9v3ae1WiJ5ZqW7mjXhAt0pOEfftfzjrMLUSYcBgjGFkaSOMzBr1wk
	AU/7STmH2geZ9qz2hcLXi+CpgMAM3/OLYAhFzeevEyFYSSPuf6Mg0LMBIqL8lNnVP0wjNv/I9qW
	jKHwoQ/wzwSoPR6ZnQYDhCRqJHl+bmt2TtpjtU4Ws6jG6fBdBt0VoNk1CUqSpFFAq6yj33nNCfo
	r6cQTl4lCJVTYiplx1/x1+q2KpYuqTjP9TJ1U/QwnIseakJrw8rqjV+M3NQ3w97LAvR1PInokDl
	GK8rV0Axp7C2V0G8lAhp7zG6JfXOLLbKQjtOZd6OrcYwcDWpcaaukdYqJPJH4zRqFl8Z4kMUsvQ
	E7NfH/4DWaqfFIOb2xl9F2B1f0NU3+/Z5JNyipddi4SP6uqvrAwkaI4nyWDj4hB2t/Rn130ILP1
	4dfpilmjr3EEnr25qHn7D5twTIAtdNdpWD0NtI8J18YfFAfNG+UH0rlz8UH
X-Received: by 2002:a17:906:9f90:b0:c2d:be57:f73a with SMTP id a640c23a62f3a-c4679536f80mr679402366b.13.1792687230949;
        Thu, 22 Oct 2026 09:40:30 -0700 (PDT)
Received: from carbon.k.g ([95.43.162.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cfb941sm5456866b.82.2026.10.22.09.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:40:30 -0700 (PDT)
Date: Thu, 22 Oct 2026 19:40:28 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu
 board
Message-ID: <20261022164028.GC3711@carbon.k.g>
References: <20261022140244.3476844-1-petko.manolov@konsulko.com>
 <20261022140244.3476844-2-petko.manolov@konsulko.com>
 <sashiko-outbox-181612@kernel.org>
 <aton_teIric7IKX8@SMW015318>
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
In-Reply-To: <aton_teIric7IKX8@SMW015318>

On 26-10-22 10:13:02, Frank Li wrote:
> On Thu, Oct 22, 2026 at 02:10:36PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Low] dt-bindings: arm: fsl: undocumented draeger vendor prefix in fsl.yaml
> > --
> >
> > commit 3465979b7c116a128c865587fd61bc41cff5927b
> > Author: Petko Manolov <petko.manolov@konsulko.com>
> >
> > dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
> >
> > This commit adds the draeger,imx6q-m48 and draeger,imx6dl-m48 board
> > compatible strings to Documentation/devicetree/bindings/arm/fsl.yaml.
> >
> > > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > index 656f2596e1d53..8f3a04228780a 100644
> > > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > @@ -260,6 +260,7 @@ properties:
> > >                - boundary,imx6q-nitrogen6x
> > >                - compulab,cm-fx6           # CompuLab CM-FX6
> > >                - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
> > > +              - draeger,imx6q-m48         # Draeger imx6q variant of M48
> > >                - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
> > >                - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
> > >                - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
> > > @@ -458,6 +459,7 @@ properties:
> > >                - boundary,imx6dl-nit6xlite     # Boundary Devices Nitrogen6 Lite
> > >                - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitrogen6x
> > >                - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
> > > +              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
> > >                - eckelmann,imx6dl-ci4x10
> > >                - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
> > >                - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
> >
> > [Severity: Low]
> > Both hunks in properties:compatible of
> > Documentation/devicetree/bindings/arm/fsl.yaml introduce compatible strings
> > with the draeger vendor prefix (draeger,imx6q-m48 and draeger,imx6dl-m48),
> > and the follow-up commit 6e00402d882f ("arm: dts: nxp: imx: Add devicetree
> > files for M48") uses them as well.
> >
> > However, patternProperties in
> > Documentation/devicetree/bindings/vendor-prefixes.yaml does not appear to
> > have a matching "^draeger,.*" entry:
> 
> Please add a draeger entry in vendor-prefixes.yaml.

It is already in linux-next.


cheers,
Petko
