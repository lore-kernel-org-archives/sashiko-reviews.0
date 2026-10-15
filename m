Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79704A384A
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 22:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792104872; cv=none; b=ljAKunBOU5OJIs1eEsxHd8C79Wne0T7uCnJU9R1X/EvhILV6P9Xnka61YBHDdofRE5CAcrE70eWUQDBg/WBI87mH5cyO9yP453PawW+65XlBjQ801DTsNrHJ8Ft+Z6ve7vegvJXn6G3mDCiyUjkXtBGdFGjnglN6zsy/nVSnhSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792104872; c=relaxed/simple;
	bh=lx6vLG67HDPtnRj90OjJRS6Cl5KXBnbsEtkIXD607PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9aksXC9gaZEJNe6dvs6I5BWIjdNETeuA+vpOEkqFO4l03XehLXm0lCscqGhGqW+AzPjKUYFz8iV1IG4ZqH8FarFT4HXydHhi39oiAsOOnxrmgKRZLXBAMQyuo5bRww59KGhX/v6AKXhQzQA0j/VqykSTy/HTdXE4Y7uWfZS6fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=VQG7J4BI; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="VQG7J4BI"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5351748222cso17509771cf.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 15:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792104869; x=1792709669; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w5g/qpIgvj6wMX7CCQKIX7PAX2lJ6Da0UK3Xl6Ms4Rk=;
        b=VQG7J4BILA28A5HbsH4rqnnkaSqU9g+2G3JqIeMMtECI1+yVIi+s3iEQcP3YB7Ar++
         liC1dGTBqc5EoCz3qbK20ltqByUny+UW1xYbwoQgo4k23e89It72oFq5Q4PG1MnZ/tnZ
         XmqtGt6kr0MEztdbxvNKlcnYlZBFHTO4xOhDdOTGiirDmtmVV+Ad+4YlJzDtX5R+4MRc
         qxAJ+T/Sda6k6w2jf+x4Am07we6jxbUQWxjrMGk/T2aMgwbLFEg/STX9iY0pie9Dy4T1
         EoDA/dTFm84lBRtJ7kQPmH4hR76zhPdJ9i8w7IbEqICUuRB8+JukwU17u3c07rf6lKaZ
         blsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792104869; x=1792709669;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w5g/qpIgvj6wMX7CCQKIX7PAX2lJ6Da0UK3Xl6Ms4Rk=;
        b=yrFViIcr4qqAiTbyptR8X+1R/pLnBjJi2LTH2JwmiMwZqLSYSV2eYqnqzehX89u+71
         dOBl6hV/wkVWtDXZ68p1u97HNQXQVhKy38LjDeQaNc7Lw+6DzmGTXl1+K3ubduiKEDTX
         Qbawm5TNZO1TZt48XURYOZt+ZViMVA/FujOOVhLCWSFK3oaq9FBgu4iDQ9bKvrIJ3FQh
         3aMqxUlC9eXL6hppJI9aRLu/yeqAkkdygYWwCKVZtB8fr+EDySpv3PfbktZ7n33uxOB6
         ElVwjg0pZI8PVVdyjHnaRiJPVCiK8q1AprptGpM4ksjg8lDwkeAyxOetGe6c2KHlkViw
         sD5A==
X-Forwarded-Encrypted: i=1; AKwUvBwph/d38s02StFbgVf7JImfRutpsaDC5VEipzxyfjSZFRMzx6ZaNWEZKEEzJwnUFEHz0HP1jk45KnVAwUccp1g=@lists.linux.dev
X-Gm-Message-State: AFq9FYINhr9pBytzWcLA1hc9yrCMJhltLWQpuikWRBo0mtbcaVsTDxg2
	ZO0ygYWI4tkuFecZ+BGXRFK2jv0CJXxvmc/thaD4L+lsDiWFv6iur3vqRAJqUXzBLKw=
X-Gm-Gg: AYBFou2TgGfEXD+YwZFKMmgxume5gqRohdnEbapoZXFmtuc0ZCgMAoOoBVOxFH7ERmO
	K3PGaRa9nxHhDdUWHHnY9VJW2NwhbJMFKNwvBYgJuDeNPp2oSADpOfVOKU+/y6zOCX0S4Lf75Ye
	mzPugPuuUDurg5dgFDJIViJwL1//CAlXohwnnjdaFBWcbxNxx2brLSsUxw8jhReGf3LMU/Rk3bC
	zR/+zSJKm0HZrP8DB5RmNT4mOpaJPtY8QCh4aaQSqu12/GffkvoWP6omDz6+TovFMDvU06mJpsy
	4CLwEG2M+NSrpytsu9OL9rRFnJw7nCHLCaokLQpuE05+k6jxGgMGs33y82N8EdED7Et/z3OR0hi
	wpLpO0IrFYNDT9nZ1JKFCbCt/FRRWq5mS9GgpywXHxo3m/kBDOgfsTFt4QNAFM5+3Tl4DLMNZOs
	/lfyBs/BJ8YjhN3E+3khuPMWibPqKhaCVkmgEWqehYJ3Zroc24PcS79kQurlmBVipapmDRxrAYs
	jQznbH9RzMXk+b6K31z3kpLAgLeRFfitqJn8eBHxANwDuGYWdagBe5Z
X-Received: by 2002:a05:622a:a16:b0:535:10be:7d5e with SMTP id d75a77b69052e-5359fb539bfmr310496441cf.46.1792104869371;
        Thu, 15 Oct 2026 15:54:29 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bccc721a8sm5238476d6.12.2026.10.15.15.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 15:54:28 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHULD-000000008uB-2yqn;
	Thu, 15 Oct 2026 19:54:27 -0300
Date: Thu, 15 Oct 2026 19:54:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Sean Hefty <shefty@nvidia.com>
Cc: Eric Davis <eric.davis@broadcom.com>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH rdma-next 02/13] RDMA/core: add the UET GID types
Message-ID: <20261015225427.GY14213@ziepe.ca>
References: <20261014-uet-ib-core-v1-0-a0e626117113@broadcom.com>
 <20261014-uet-ib-core-v1-2-a0e626117113@broadcom.com>
 <sashiko-outbox-171976@kernel.org>
 <CAMouMY+nCYZ1V_-0La4phKNkvYBke7Njhsr+HRwWkAfahgf3pg@mail.gmail.com>
 <20261015173327.GU14213@ziepe.ca>
 <DS6PR12MB53456734E5A7CFFCDD7FBCCC0CBD9C2@DS6PR12MB534567.namprd12.prod.outlook.com>
 <20261015195408.GX14213@ziepe.ca>
 <DS6PR12MB534567DB240CF76594BE5B5D0DBD9C2@DS6PR12MB534567.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS6PR12MB534567DB240CF76594BE5B5D0DBD9C2@DS6PR12MB534567.namprd12.prod.outlook.com>

On Thu, Oct 15, 2026 at 09:14:22PM +0000, Sean Hefty wrote:
> > > > > > Could this cause incoming UET packets to be incorrectly mapped
> > > > > > to a
> > > > > > RoCEv2 GID index, breaking the UET transport response?
> > > > >
> > > > > On a port that runs both RoCE and UET the MAD traffic is RoCE, so
> > > > > mapping it to RoCEv2 is correct.
> > > >
> > > > You will need seperate ROCE and UET ib_devices with the current
> > > > state of affairs, we don't support multi-protocol today.
> > >
> > > UEC intentionally considered multi-protocol devices, with a vendor deciding
> > whether it would need to provide separate SW devices.  E.g. using UET for
> > MPI, but RoCE for storage.  Protocol selection is via GID, same as RoCEv1 vs
> > v2.
> > >
> > > What blocks multi-protocol support?
> > 
> > Principally I don't think we have the APIs to discover and link the GUID to
> > protocol to QP type appropriately..
> 
> I'm missing something regarding the GUID comment.
> 
> The QP protocol comes from GID index, which is discoverable via
> ibv_gid_entry::gid_type.  (UET QPs require the GID index on create.)

Hmm, that's not the normal case, but I see what you are thinking

> E.g. a dual RoCE + UET device would report node_type = UNSPECIFIED &
> transport_type = UNSPECIFIED.  GID entries indicate supported
> protocols.

Ah, that would need some opt in scheme to get there, but I supppose it
may not be so bad.

I thought there were other issues like PDs not being entirely
compatible, MRs, and so on?

Jason
